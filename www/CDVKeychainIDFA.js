var exec = require('cordova/exec');

exports.getDeviceID = function (success,error,args) {
	if(args === undefined) {
        args = {}
    }
    exec(success, error, 'CDVkeychainIDFA', 'getDeviceID', args);
};
