# A Document Path Library for Node

[![Dependencies](https://img.shields.io/david/mrodrig/doc-path.svg)](https://www.npmjs.org/package/doc-path)
[![Downloads](http://img.shields.io/npm/dm/doc-path.svg)](https://www.npmjs.org/package/doc-path)
[![NPM version](https://img.shields.io/npm/v/doc-path.svg)](https://www.npmjs.org/package/doc-path)
[![Minzipped Size](https://flat.badgen.net/bundlephobia/minzip/doc-path)](https://bundlephobia.com/result?p=doc-path)

[![Build Status](https://travis-ci.org/mrodrig/doc-path.svg?branch=master)](https://travis-ci.org/mrodrig/doc-path)
[![Coverage Status](https://coveralls.io/repos/github/mrodrig/doc-path/badge.svg?branch=stable)](https://coveralls.io/github/mrodrig/doc-path?branch=stable)
[![Maintainability](https://api.codeclimate.com/v1/badges/8d357f67aa5aaf8d727e/maintainability)](https://codeclimate.com/github/mrodrig/doc-path/maintainability)

This module will take paths in documents which can include nested paths specified by '.'s and can evaluate the path
to a value, or can set the value at that path depending on the function called.

## Installation

```bash
$ npm install doc-path
```

## Usage

```javascript
let path = require('doc-path');
```

### API

#### path.evaluatePath(document, key)

* `document` - `Object` - A JSON document that will be iterated over.
* `key` - `String` - A path to the existing key whose value will be returned.
  * Note: If your key has a dot in it (eg. `a.b`) then be sure to escape the dot with a blackslash (eg. `a\\.b`).

If the key does not exist, `undefined` is returned.

If the object's structure is extremely deep, then an error may be thrown if the maximum call stack size is exceeded while traversing the object.

##### path.evaluatePath Example:

```javascript
const path = require('doc-path');

let document = {
    Make: 'Nissan',
    Model: 'Murano',
    Year: '2013',
    Specifications: {
        Mileage: '7106',
        Trim: 'S AWD'
    },
    Features: [
		{
		    feature: 'A/C',
			packages: [
				{name: 'Base'},
				{name: 'Premium'}
			]
		},
		{
		    feature: 'Radio',
			packages: [
				{name: 'Convenience'},
				{name: 'Premium'}
			]
		}
	]
};

console.log(path.evaluatePath(document, 'Make'));
// => 'Nissan'

console.log(path.evaluatePath(document, 'Specifications.Mileage'));
// => '7106'

console.log(path.evaluatePath(document, 'Features.feature'));
// => [ 'A/C', 'Radio' ]

console.log(path.evaluatePath(document, 'Features.packages.name'));
// => [ ['Base', 'Premium'], ['Convenience', 'Premium'] ]
```

#### path.setPath(document, key, value)

* `document` - `Object` - A JSON document that will be iterated over.
* `key` - `String` - A path to the existing key whose value will be set.
  * Note: If your key has a dot in it (eg. `a.b`) then be sure to escape the dot with a blackslash (eg. `a\\.b`).
* `value` - `*` - The value that will be set at the given key.

If the key does not exist, then the object will be built up to have that path.
If no document is provided, an error will be thrown.
If the object's structure is extremely deep, then an error may be thrown if the maximum call stack size is exceeded while traversing the object.

#### path.setPath Example:

 ```javascript
 const path = require('doc-path');

 let document = {
     Make: 'Nissan',
     Features: [
         { feature: 'A/C' }
     ]
 };

 console.log(path.setPath(document, 'Color.Interior', 'Tan'));
 /*
	{ 
		Make: 'Nissan',
		Features: [
			{ feature: 'A/C' }
		]
		Color: { 
			Interior: 'Tan'
		}
	}
 */

 console.log(path.setPath(document, 'StockNumber', '34567'));
 /*
	{ 
		Make: 'Nissan',
		Features: [
			{ feature: 'A/C' }
		]
		Color: { 
			Interior: 'Tan'
		},
		StockNumber: '34567'
	}
 */
 
 console.log(path.setPath(document, 'Features.cost', '$0 (Standard)'));
  /*
 	{ 
		Make: 'Nissan',
		Features: [
			{
				feature: 'A/C',
				cost: '$0 (Standard)'
			}
		]
		Color: { 
			Interior: 'Tan'
		},
		StockNumber: '34567'
 	}
  */
 ```

## Tests

```bash
$ npm test
```

_Note_: This requires `mocha`, `should`, `async`, and `underscore`.

To see test coverage, please run:
```bash
$ npm run coverage
```

Current Coverage is:
```
Statements   : 100% ( 33/33 )
Branches     : 100% ( 24/24 )
Functions    : 100% ( 3/3 )
Lines        : 100% ( 29/29 )
```

## Features

- Supports keys with escaped `.` characters (as of v3.0.0)
- Supports nested paths
  - Including keys of objects inside arrays! (as of v2.0.0)
- Same common path specification as other programs such as MongoDB
