import { combineReducers } from 'redux';
import searchResult from './search_reducer';

const rootReducer = combineReducers({
    search: searchResult
});

export default rootReducer;