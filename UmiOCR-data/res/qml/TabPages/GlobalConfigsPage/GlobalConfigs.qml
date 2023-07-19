// =========================================
// =============== 全局配置项 ===============
// =========================================

import QtQuick 2.15
import "../../Configs"
import "../../Api"

Configs {
    category_: "Global"

    configDict: {
        "ui": {
            "title": qsTr("界面"),
            "type": "group",

            "theme": {
                "title": qsTr("主题"),
                "optionsList": app.themeManager.themeList, // 从全局主题管理器中取列表
                "onChanged": (val)=>{
                    app.themeManager.switchTheme(val)
                },
            },
            "enabledEffect": {
                "title": qsTr("启用动画效果"),
                "default": true,
                "toolTip": qsTr("在低配置机器上，关闭动画效果可减少一丢丢资源占用"),
                "onChanged": (flag)=>{
                    app.themeManager.switchEnabledEffect(flag)
                },
            },
        },
        // OCR接口全局设定
        "ocr": ocrManager.globalOptions
    }

    OcrManager { id: ocrManager } // OCR管理器
    UtilsConfigDicts { id: utilsDicts } // 通用配置项

    property alias ocrManager: ocrManager
    property alias utilsDicts: utilsDicts

    Component.onCompleted: {
        console.log("% GlobalConfig 初始化全局配置完毕！")
    }
}