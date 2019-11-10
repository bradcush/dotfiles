module.exports = {
    danglingCommas: false,
    environments: [
        'browser',
        'builtin',
        'jest',
        'mocha',
        'node'
    ],
    excludes: [
        '**/node_modules/**/*',
        '**/Popup/meta/chrome.js'
    ],
    globals: [
        'chrome',
        'key',
        'runtime',
        'T'
    ],
    useRelativePaths: false
}
