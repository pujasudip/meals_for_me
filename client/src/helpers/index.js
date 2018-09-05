export function formatPostData(data){
    let params = new URLSearchParams();
    for(let [k, v] of Object.entries(data)){
        params.append(k, v);
    }
    return params;
}

export function formatQueryString(userInputArray){
    switch(userInputArray.length){
        case 1:
            return {params: {
                one: userInputArray[0]
            }};
        case 2:
            return {
                params: {
                    one: userInputArray[0],
                    two: userInputArray[1],
                }
            };
        case 3:
            return {
                params: {
                    one: userInputArray[0],
                    two: userInputArray[1],
                    three: userInputArray[2],
                }
            };
        default:
            return;

    }
}