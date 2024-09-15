import {useState} from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import Boton from "./components/boton.jsx";

function App() {
    const [count, setCount] = useState(0)

    return (
        <>
            <Boton texto={count} onClick={() => setCount(count + 1)}/>
        </>
    )
}

export default App
