import types from '../actions/types';

const DEFAULT_STATE = {
    shoppingList: []
};
 function shoppingList(state=DEFAULT_STATE, action){
    switch(action.type){
        case types.ADD_TO_SHOPPINGLIST:
            let list = [...state.shoppingList, action.payload];
            return {...state, list};
        default:
            return state;
    }
}

export default shoppingList;