import { combineReducers } from 'redux';
import searchResult from './search_reducer';
import userLoginResponse from './login_reducer';
import login_status from './login_status_reducer';

const rootReducer = combineReducers({
    search: searchResult,
    userLoginResponse: userLoginResponse,
    login_status: login_status
});

export default rootReducer;