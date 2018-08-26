export function formatPostData(data){
    let params = new URLSearchParams();
    for(let [k, v] of Object.entries(data)){
        params.append(k, v);
    }
    return params;
}