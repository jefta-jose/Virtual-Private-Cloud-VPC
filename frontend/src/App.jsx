import './App.css'
import { useCreateMovieMutation, useGetMoviesQuery, useDeleteMovieMutation } from './features/movies'

function App() {
    const { data: movies } = useGetMoviesQuery();
    const [createMovie] = useCreateMovieMutation();
    const [deleteMovie] = useDeleteMovieMutation();

    const handleDeleteMovie = async (id) => {
        try {
            await deleteMovie(id);
        } catch (error) {
            console.error('Error deleting movie:', error);
        }
    }

    //add a new movie
    const handleCreateMovie = async() =>{
      try {
        await createMovie({
          title: 'New Movie',
          description: 'Description of new movie',
          year: 2023
        });
      } catch (error) {
        console.error('Error creating movie:', error);
      }
    } 
    

  return (
    <>
      <button onClick={handleCreateMovie}>Create New Movie</button>
      <div className='movies-table'>
        <table>
          <thead>
            <tr>
              <th>Title</th>
              <th>Description</th>
              <th>Year</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {movies && movies.map(movie => (
              <tr key={movie.id}>
                <td>{movie.title}</td>
                <td>{movie.description}</td>
                <td>{movie.year}</td>
                <td className='actions'>
                  <button>Update</button>
                  <button onClick={()=> handleDeleteMovie(movie.id)} >Delete</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </>
  )
}

export default App
