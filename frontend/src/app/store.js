import { configureStore } from '@reduxjs/toolkit';
import { setupListeners } from '@reduxjs/toolkit/query/react';
import { moviesApi } from '../features/movies';

export const store = configureStore({
    reducer: {
        [moviesApi.reducerPath]: moviesApi.reducer
    },
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware().concat(moviesApi.middleware)
});

setupListeners(store.dispatch);