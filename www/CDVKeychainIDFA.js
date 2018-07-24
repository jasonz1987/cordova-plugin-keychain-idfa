var cordova = require('cordova');

module.exports = {
	getDeviceID :function (success,error,args) {
		if(args === undefined) {
	        args = {}
	    }
	    cordova.exec(success, error, 'KeychainIDFA', 'getDeviceID', [args]);
	},
	deleteDeviceID :function (success,error,args) {
		if(args === undefined) {
	        args = {}
	    }
	    cordova.exec(success, error, 'KeychainIDFA', 'deleteDeviceID', [args]);
	}
}
