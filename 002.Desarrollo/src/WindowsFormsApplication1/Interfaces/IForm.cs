
namespace MercadoEnvioDesktop.Interfaces
{
    public interface IForm
    {
        void ejecutarSQL();
        void manejarEvento(int numeroEvento);
        void manejarEventoGrilla(int numeroEvento,long idSeleccionado);
    }
}