/******************************************************************************
 *  spydroid.js
 *
 *  @copyright: (c) 2014 WellHealthBook (http://www.wellhealthbook.com)
 *  @author: SpyDroid (spydroid@me.com) 2014
 *
 *  @license: GNU GPL v3, you can find a copy of that license under LICENSE
 *      file or by visiting: http://www.fsf.org/licensing/licenses/gpl.html
 *
 *****************************************************************************/


function WHB_Util() {
}

WHB_Util.fixScriptInnerHTML = function(obj) {
    if (typeof(obj.getElementsByTagName) != "function") return;
    var script = obj.getElementsByTagName("script");
    var js = new Array();
    for (i = 0; i < script.length; i++) {
        js.push(script[i].text);
    }
    window.eval(js.join("\n\n"));
}

WHB_Util.setInnerHTMLDojo = function(obj, value) {
    return this.setInnerHTML(obj, value);
}

WHB_Util.setInnerHTML = function(obj, value, append) {
    if (typeof(obj) != "object") {
        obj = document.getElementById(obj);
        if (typeof(obj) != "object") return false;
    }
    if (typeof(append) == "undefined") append = false;
    if (!append) obj.innerHTML = "";
    var div = document.createElement("div");
    div.innerHTML = value;
    for (var i = 0; i < div.childNodes.length; i++) {
        obj.appendChild(div.childNodes[i]);
    }
    this.fixScriptInnerHTML(obj);
    return true;
}
