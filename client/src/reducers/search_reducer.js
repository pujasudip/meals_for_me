const DEFAULT_STATE = {
    currentTime: new Date().toLocaleTimeString()
};

function  searchResult(state = DEFAULT_STATE, action){
    switch (action.type) {
        case 'recipe':
            return { userI: action.payload };
        default:
            return state

    }
}

export default searchResult;