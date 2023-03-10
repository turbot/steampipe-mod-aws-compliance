'use strict';

const utils = require('./utils.js');

module.exports = {
    deepKeys: deepKeys,
    deepKeysFromList: deepKeysFromList
};

/**
 * Return the deep keys list for a single document
 * @param object
 * @param options
 * @returns {Array}
 */
function deepKeys(object, options) {
    options = mergeOptions(options);
    if (utils.isObject(object) && object !== null) {
        return generateDeepKeysList('', object, options);
    }
    return [];
}

/**
 * Return the deep keys list for all documents in the provided list
 * @param list
 * @param options
 * @returns Array[Array[String]]
 */
function deepKeysFromList(list, options) {
    options = mergeOptions(options);
    return list.map((document) => { // for each document
        if (utils.isObject(document)) {
            // if the data at the key is a document, then we retrieve the subHeading starting with an empty string heading and the doc
            return deepKeys(document, options);
        }
        return [];
    });
}

function generateDeepKeysList(heading, data, options) {
    let keys = Object.keys(data).map((currentKey) => {
        // If the given heading is empty, then we set the heading to be the subKey, otherwise set it as a nested heading w/ a dot
        let keyName = buildKeyName(heading, escapeNestedDotsIfSpecified(currentKey, options));

        // If we have another nested document, recur on the sub-document to retrieve the full key name
        if (isDocumentToRecurOn(data[currentKey])) {
            return generateDeepKeysList(keyName, data[currentKey], options);
        } else if (options.expandArrayObjects && isArrayToRecurOn(data[currentKey])) {
            // If we have a nested array that we need to recur on
            return processArrayKeys(data[currentKey], keyName, options);
        } else if (options.ignoreEmptyArrays && isArrayToRecurOn(data[currentKey]) && !data[currentKey].length) {
            return [];
        }
        // Otherwise return this key name since we don't have a sub document
        return keyName;
    });

    return utils.flatten(keys);
}

/**
 * Helper function to handle the processing of arrays when the expandArrayObjects
 * option is specified.
 * @param subArray
 * @param currentKeyPath
 * @param options
 * @returns {*}
 */
function processArrayKeys(subArray, currentKeyPath, options) {
    let subArrayKeys = deepKeysFromList(subArray, options);

    if (!subArray.length) {
        return options.ignoreEmptyArraysWhenExpanding ? [] : [currentKeyPath];
    } else if (subArray.length && utils.flatten(subArrayKeys).length === 0) {
        // Has items in the array, but no objects
        return [currentKeyPath];
    } else {
        subArrayKeys = subArrayKeys.map((schemaKeys) => {
            if (isEmptyArray(schemaKeys)) {
                return [currentKeyPath];
            }
            return schemaKeys.map((subKey) => buildKeyName(currentKeyPath, escapeNestedDotsIfSpecified(subKey, options)));
        });

        return utils.unique(utils.flatten(subArrayKeys));
    }
}

function escapeNestedDotsIfSpecified(key, options) {
    if (options.escapeNestedDots) {
        return key.replace(/\./g, '\\.');
    }
    return key;
}

/**
 * Function used to generate the key path
 * @param upperKeyName String accumulated key path
 * @param currentKeyName String current key name
 * @returns String
 */
function buildKeyName(upperKeyName, currentKeyName) {
    if (upperKeyName) {
        return upperKeyName + '.' + currentKeyName;
    }
    return currentKeyName;
}

/**
 * Returns whether this value is a document to recur on or not
 * @param val Any item whose type will be evaluated
 * @returns {boolean}
 */
function isDocumentToRecurOn(val) {
    return utils.isObject(val) && !utils.isNull(val) && !Array.isArray(val) && Object.keys(val).length;
}

/**
 * Returns whether this value is an array to recur on or not
 * @param val Any item whose type will be evaluated
 * @returns {boolean}
 */
function isArrayToRecurOn(val) {
    return Array.isArray(val);
}

/**
 * Helper function that determines whether or not a value is an empty array
 * @param val
 * @returns {boolean}
 */
function isEmptyArray(val) {
    return Array.isArray(val) && !val.length;
}

function mergeOptions(options) {
    return {
        expandArrayObjects: false,
        ignoreEmptyArraysWhenExpanding: false,
        escapeNestedDots: false,
        ignoreEmptyArrays: false,
        ...options || {}
    };
}
