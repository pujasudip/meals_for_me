import types from '../actions/types';

const DEFAULT_STATE = {
    userLoginResponse: ''
};

export default (state = DEFAULT_STATE, action) => {
    switch(action.type){
        case types.LOGIN:
            return { userLoginResponse: action.payload};
        case types.USER_LOGOUT:
            return { userLoginResponse: { userLoginResponse: false }};
        default:
            return state;
    }
}