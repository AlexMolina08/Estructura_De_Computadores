#include <gtk/gtk.h> //Glib library entre otras incluida

int contador = 0;

/*****************************************************************************
    callback functions
*****************************************************************************/

void saludar( GtkWidget *widget , gpointer data ){

    //equivalente de printf en GTK+
    g_print("Bienvenido a GTK\n");
    g_print("%s pulsado %d veces\n" ,
            (char*)data , ++contador);

}

//destruir ventana (cuando pulsemos el boton de cerrar ventana)
void destroy_window( GtkWidget* widget, gpointer data ){
    gtk_main_quit ();
}





/*****************************************************************************
*****************************************************************************/
int main(int argc , char* argv[]){
    GtkWidget *window; //ventana
    GtkWidget *button; //boton

    gtk_init(&argc , &argv);

    //creacion ventana y boton
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    button = gtk_button_new_with_label("PÚLSAME :D");

    //conectamos window a funcion callback de destruir ventana
    g_signal_connect(window, "destroy", 
                     G_CALLBACK(destroy_window), NULL); 

    //conectamos boton a funcion callback saludar
    g_signal_connect(GTK_OBJECT(button),"clicked",
                     G_CALLBACK(saludar),
                     "botón");

    //añadimos al container de window el boton
    gtk_container_add(GTK_CONTAINER(window),button);
    
    gtk_widget_show_all(window);
    gtk_main();

    return 0;

}



