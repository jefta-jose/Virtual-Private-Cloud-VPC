import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'

export const moviesApi = createApi({
    reducerPath: 'moviesApi',
    baseQuery: fetchBaseQuery({ baseUrl: 'http://127.0.0.1:8000' }),
    tagTypes: ['movie'],

    endpoints: (builder) => ({
        // add new movie
        createMovie: builder.mutation({
            query: (movieData) => ({
                url: '/movies',
                method: 'POST',
                body: movieData
            }),
            invalidatesTags: ['movie']
        }),
        // get all movies
        getMovies: builder.query({
            query: () => '/movies',
            providesTags: ['movie']
        }),
        // get movie by id
        getMovieById: builder.query({
            query: (id) => `/movies/${id}`,
            providesTags: ['movie']
        }),
        // update movie
        updateMovie: builder.mutation({
            query: ({ id, ...movieData }) => ({
                url: `/movies/${id}`,
                method: 'PUT',
                body: movieData
            }),
            invalidatesTags: ['movie']
        }),
        // delete movie
        deleteMovie: builder.mutation({
            query: (id) => ({
                url: `/movies/${id}`,
                method: 'DELETE'
            }),
            invalidatesTags: ['movie']
        }),
    })
});

export const {
    useCreateMovieMutation,
    useGetMoviesQuery,
    useGetMovieByIdQuery,
    useUpdateMovieMutation,
    useDeleteMovieMutation
} = moviesApi;