import { combineReducers } from 'redux';
import searchRecipe from './search_reducer';
import userLoginResponse from './login_reducer';
import login_status from './login_status_reducer';
import { reducer as formReducer } from 'redux-form';

const rootReducer = combineReducers({
    search: searchRecipe,
    userLoginResponse: userLoginResponse,
    login_status: login_status,
    logout: userLoginResponse,
    form: formReducer,
});

export default rootReducer;