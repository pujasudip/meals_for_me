import types from '../actions/types';

const DEFAULT_STATE = {
    favorites: []
};

export default function favorites(state=DEFAULT_STATE, action){
    switch(action.type){
        case types.ADD_TO_FAVORITE:
            // let list = [...state.favorites, action.payload];
            return {state};
        case types.DELETE_FROM_FAVORITE:
            return state;
        case types.GET_FAVORITE:
            let list = [...state.favorites, ...action.payload.data.data];
            console.log('list:', list);
            return {...state, favorites: list};
        default:
            return state;
    }
}