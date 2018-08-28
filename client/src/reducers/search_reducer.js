import types from '../actions/types';

const DEFAULT_STATE = {
    ingredients: []
};

function  searchResult(state = DEFAULT_STATE, action){
    switch (action.type) {
        case types.ADD_INGREDIENT:
            let ingredients = [ ...state.ingredients, action.payload ];
            return { ...state, ingredients };
        case types.REMOVE_INGREDIENT:
            ingredients = [...state.ingredients];
            ingredients.splice(action.payload, 1);
            return { ...state, ingredients};
        case types.CLEAR_USER_INGREDIENT_INPUTS:
            return {ingredients: []};
        default:
            return state;

    }
}

export default searchResult;