var exec = require('cordova/exec');

exports.getDeviceID = function (arg0, success, error) {
    exec(success, error, 'CDVkeychainIDFA', 'getDeviceID', [arg0]);
};
