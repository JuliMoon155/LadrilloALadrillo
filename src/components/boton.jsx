function Boton(props) {
    return (
        <button onClick={props.onClick}>{props.texto}</button>
    );
}

export default Boton;