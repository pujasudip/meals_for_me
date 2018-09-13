import types from '../actions/types';

const DEFAULT_STATE = {
    favorites: []
};

export default function favorites(state=DEFAULT_STATE, action){
    switch(action.type){
        case types.ADD_TO_FAVORITE:
            let list = [...state.favorites, action.payload];
            if(state.favorites.includes(action.payload)){
                return state;
            };
            return {...state, favorites: list};
        case types.REMOVE_FROM_FAVORITE:
            return state;
        case types.GET_FAVORITE:
            return {...state, favorites: action.payload};
        default:
            return state;
    }
}