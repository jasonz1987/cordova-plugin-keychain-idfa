# cordova-plugin-keychain-idfa

Get ios unique device id by **keychain+idfa**

if you can't use AdSupport,please check [UUID+KEYCHAIN](https://github.com/jasonz1987/cordova-plugin-keychain-uuid)

more info please see my article ：http://www.jason-z.com/post/22



[中文文档](README_CN.md)

# Exmaple

[Ionic3 Demo](https://github.com/jasonz1987/ionic-keychain-idfa-demo)



# Install

```
cordova plugin add cordova-plugin-keychain-idfa
```



# Methods



### get device id from keychain

```javascript
var args = {
  'key':'com.jason-z.test.idfa'
};

KeychainIDFA.getDeviceID((id)=>{
 console.log(id);   
},(err)=>{
    console.log(err);
})
```



###  delete device id from keychain

```javascript
var args = {
  'key':'com.jason-z.test.idfa'
};

KeychainIDFA.deleteDeviceID((id)=>{
 console.log(id);   
},(err)=>{
    console.log(err);
})
```



*you can define **key** value by your own*



# Warning

this plugin depends on **AdSupport.Framework**，so you must select right choice  when submit your app to App Store. you can refer below choice if you havn't add any ads in your app.


![appstore审核](screenshot-1.png)


# Donate

If this project help you reduce time to develop, you can give me a cup of coffee :)



[![paypal](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/jasonz1987/6.66)


