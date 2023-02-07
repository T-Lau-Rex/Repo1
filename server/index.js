// IMPORTACIONES

import app from './app.js'

// PUERTO
app.set('port', process.env.PORT || 3000);
const port = app.get('port');

// ARRANCAR SERVIDOR
app.listen(port, () => {console.log(`Servidor en puerto ${port}\nClica aqui: http://localhost:${port}`)})



// ======================== minuto 29:50