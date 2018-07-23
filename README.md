# 项目说明
通过idfa+keychain获取ios的唯一设备id

# 安装方法

```
cordova plugin add cordova-plugin-keychain-idfa
```

# 调用
```
window.plugin.KeychainIDFA.getDeviceID().then((id)=>{
 console.log(id);   
},(err)=>{
    console.log(err);
})
```

