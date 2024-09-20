import {useState} from 'react'
import './App.css'
import Boton from "./presentacion/boton.jsx";

function App() {
    const [count, setCount] = useState(0)

    return (
        <>
            <Boton texto={count} onClick={() => setCount(count + 1)}/>
        </>
    )
}

export default App
