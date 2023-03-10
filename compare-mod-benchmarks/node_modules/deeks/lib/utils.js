'use strict';

module.exports = {
    // underscore replacements:
    isNull,
    isObject,
    unique,
    flatten
};

/*
 * Helper functions which were created to remove underscorejs from this package.
 */

function isObject(value) {
    return typeof value === 'object';
}

function isNull(value) {
    return value === null;
}

function unique(array) {
    return [...new Set(array)];
}

function flatten(array) {
    return [].concat(...array);
}
