using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace DemoApplication
{
  class Program
  {
    static void Main(string[] args)
    {

      string name = "波波";
      int age = 18;
      string str = string.Format("my name is{0}, I'm {1} years old", name, age);
      string str2 = $"my name is{name}, I'm {age} years old";
      string str3 = string.Format("Today is {0:D}", DateTime.Now);
      string str4 = $"Today is {DateTime.Now:D}";
      Console.WriteLine($"{str}");
      Console.WriteLine($"{str2}");
      Console.WriteLine($"{str3}");
      Console.WriteLine($"{str4}");
      Console.ReadKey();
    }
  }
}



