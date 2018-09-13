import types from '../actions/types';

const DEFAULT_STATE = {
    favorites: []
};

export default function favorites(state=DEFAULT_STATE, action){
    switch(action.type){
        case types.ADD_TO_FAVORITE:
            let list = [action.payload];
            return {state};
        case types.DELETE_FROM_FAVORITE:
            let recipe_id = action.payload;
            let newList = [...state.favorites];
            let tobeDeletedIndex = '';
            for(var i = 0; i < newList; i++){
                if(newList[i].recipe_id === recipe_id){
                    tobeDeletedIndex = i;
                }
            }
            newList.splice(tobeDeletedIndex, 1);
            console.log('aa:', newList);
            return {favorites: newList};
        case types.GET_FAVORITE:
            list = [...action.payload.data.data];
            console.log('list:', list);
            return {...state, favorites: list};
        default:
            return state;
    }
}