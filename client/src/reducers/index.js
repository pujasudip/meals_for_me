import { combineReducers } from 'redux';
import searchRecipe from './search_reducer';
import userLoginResponse from './login_reducer';
import login_status from './login_status_reducer';

const rootReducer = combineReducers({
    search: searchRecipe,
    userLoginResponse: userLoginResponse,
    login_status: login_status,
});

export default rootReducer;