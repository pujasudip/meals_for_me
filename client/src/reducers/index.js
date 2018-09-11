import { combineReducers } from 'redux';
import searchRecipe from './search_reducer';
import userLoginResponse from './login_reducer';
import login_status from './login_status_reducer';
import { reducer as formReducer } from 'redux-form';
import shoppingList from './shoppinglist_reducer';

const rootReducer = combineReducers({
    search: searchRecipe,
    userLoginResponse: userLoginResponse,
    login_status: login_status,
    logout: userLoginResponse,
    form: formReducer,
    shoppingList: shoppingList
});

export default rootReducer;