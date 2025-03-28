using System;
using System.Net;
using System.Text;
using System.Threading;

namespace MicroserviceDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            HttpListener listener = new HttpListener();
            listener.Prefixes.Add("http://*:5000/");
            listener.Start();
            Console.WriteLine("API corriendo en el puerto 5000...");

            while (true)
            {
                HttpListenerContext context = listener.GetContext();
                string response = "{ \"mensaje\": \"Hola Charly, desde Mono Linux\" }";
                byte[] buffer = Encoding.UTF8.GetBytes(response);
                context.Response.ContentType = "application/json";
                context.Response.ContentLength64 = buffer.Length;
                context.Response.OutputStream.Write(buffer, 0, buffer.Length);
                context.Response.OutputStream.Close();
            }
        }
    }
}
