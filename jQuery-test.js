
    $.sanjiGetJSON = function (url,data,callback){
        $.ajax({
            url:url,
            type:"get",
            contentType:"application/json",
            dataType:"json",
            timeout:10000,
            data:data,
            success:function(data){
                callback(data);
            }
        });
    };

    
    $.postJSON = function(url,data,callback){
        $.ajax({
            url:url,
            type:"post",
            contentType:"application/json",
            dataType:"json",
            data:data,
            timeout:60000,
            success:function(msg){
                callback(msg);
            },
            error:function(xhr,textstatus,thrown){

            }
        });
    };

    $.putJSON = function(url,data,callback){
        $.ajax({
            url:url,
            type:"put",
            contentType:"application/json",
            dataType:"json",
            data:data,
            timeout:20000,
            success:function(msg){
                callback(msg);
            },
            error:function(xhr,textstatus,thrown){

            }
        });
    };
    
    $.deleteJSON = function(url,data,callback){
        $.ajax({
            url:url,
            type:"delete",
            contentType:"application/json",
            dataType:"json",
            data:data,
            success:function(msg){
                callback(msg);
            },
            error:function(xhr,textstatus,thrown){

            }
        });
    };

/**
 *
 * @param String type  HTTP请求方式
 * @param url String   请求url
 * @param callback  回调函数(必须)
 * @param params    参数
 * @param extra     额外ajax config
 * @private
 */
function _request(type, url, callback, param={}, extra = {})
{
    let access_token = document.head.querySelector('meta[name="csrf-token"]').content;
    let loadT = layer.msg('Please wait a moment...', {icon:16, time:0, shade: [0.3, '#000']});
    type = type.toUpperCase()

    let extras = {
        contentType: "json",
        timeout: 5000
    }
    let params = {}

    extras = extra ? $.extend(extras, extra) : extras
    params = param ? $.extend(params, param) : params

    // if (extras.contentType == 'json') {
    //     params = JSON.stringify(params)
    // }
    //console.log(params)
    //params = JSON.stringify(params)
    $.ajax({
        type: type,
        dataType: 'json',
        //contentType: 'application/json; charset=utf-8',
        url: url,
        data: params,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Access-Token", gm_token)
            xhr.setRequestHeader("Access-Key", gm_token)
        },
        cache: true,
        async: true,
        error: function (xhr) {
            layer.close(loadT)
            if (xhr.status != 200) {
                console.error(xhr)
                layer.msg(xhr.status+'！'+xhr.statusText+'！',{icon:2,time:4000})
            }else {
                callback(xhr)
            }
        },
        success: function (xhr) {
            layer.close(loadT)
            callback(xhr)
        },
        timeout: extra.timeout
    })
}