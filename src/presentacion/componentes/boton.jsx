import PropTypes from "prop-types";

function Boton({texto, accion}) {
    return (
        <button onClick={accion}>{texto}</button>
    );
}

Boton.propTypes = {
    texto: PropTypes.string,
    accion: PropTypes.func,
}

export default Boton;