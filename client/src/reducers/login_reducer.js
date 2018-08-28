import types from '../actions/types';

const DEFAULT_STATE = {
    userLoginResponse: ''
};

export default (state = DEFAULT_STATE, action) => {
    switch(action.type){
        case types.LOGIN:
            return { userLoginResponse: action.payload};
        default:
            return state;
    }
}