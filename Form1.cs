using CLIPSNET;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Minecraft
{
    public partial class Form1 : Form
    {
        const string minecraft = "../../minecraft.clp";
        const string minecraft_Base = "../../minecraft_base.clp";
        const string FactsPath = "..//..//facts1.txt";
        const string RulesPath = "..//..//rules2.txt";


        public Dictionary<int, Fact> facts;
        public IEnumerable<Rule> rules;
        public Dictionary<int, Fact> initialFacts;
        public Dictionary<int, Fact> terminals;
        public Dictionary<string, bool> finded;

        CLIPSNET.Environment clips = new CLIPSNET.Environment();

        public Form1()
        {
            InitializeComponent();
            facts = Parser.ParseFacts(FactsPath).ToDictionary(f => f.FactID, f => f);
            rules = Parser.ParseRules(RulesPath, facts);
            initClipsRules();
            initialFacts = new Dictionary<int, Fact>();
            terminals = new Dictionary<int, Fact>();
            finded = new Dictionary<string, bool>();
            load();
        }
        // добавить правила в нужном формате в файл CLIPS  
        private void initClipsRules()
        {
            var clipsBaseText = File.ReadAllText(minecraft_Base, Encoding.UTF8);
            var stringBuilder = new StringBuilder(clipsBaseText);
            foreach (var r in rules)
            {
                stringBuilder.Append(r.ToClips());
                stringBuilder.Append("\n\n");
            }
            File.WriteAllText(minecraft, stringBuilder.ToString(), Encoding.UTF8);
        }
        // Загрузить факты в списки
        private void load()
        {
            foreach (var fact in facts.Values)
            {
                allFactsListBox.Items.Add(fact.ToListItem());
            }
        }

        // достает id файла из строки в списке
        private int parseFactID(string str)
        {
            return int.Parse(str.Split('.')[0]);
        }

        // добавление начального фактов
        private void addInitialFact(int factID)
        {
            if (initialFacts.ContainsKey(factID))
                return;
            var fact = facts[factID];
            initialFacts[factID] = fact;
            initialFactsListBox.Items.Add(fact.ToListItem());
        }
        // добавление терминала
        private void addTerminal(int factID)
        {
            if (terminals.ContainsKey(factID))
                return;
            start.Enabled = true;

            var fact = facts[factID];
            terminals[factID] = fact;
            terminalsListBox.Items.Add(fact.ToListItem());
        }
        //Добавить заданные факты в CLIPS
        private void addFactsToClips()
        {
            foreach (var fact in initialFacts.Values)
            {
                clips.Eval($"(assert {fact.ToClips()})");
                textBox2.Text += $"Добавлен исходный факт {fact.ToListItem()}" + System.Environment.NewLine;
            }
        }
        // Обработать полученное сообщение от CLIPS
        private void handleMessage(string message)
        {
            textBox2.Text += message + System.Environment.NewLine;
        }

        // Выполнить шаг вывода в CLIPS
        private bool nextStep()
        {
            clips.Run();
            var facts = clips.GetFactList();
            try
            {
                var fact = facts.First(f => f.RelationName == "sendmessagehalt");
                var factValues = fact.GetSlotValues()[0].Contents.Replace("\"", "").Split('|');
                var ruleDescription = factValues[0].Substring(1);
                var consequence = factValues[1].Split('|')[0];
                if (finded.ContainsKey(consequence))
                {
                    finded[consequence] = true;
                    MessageBox.Show($"Вывели терминал: {consequence}!");
                }
                handleMessage(ruleDescription);
                clips.Eval("(assert (clearmessage))");
            }
            catch (InvalidOperationException)
            {
                MessageBox.Show($"Вывод закончен! Не вывели: {string.Join(", ", finded.Where(p => !p.Value).Select(p => p.Key).ToArray())}");
                return false;
            }
            return true;
        }

        // добавляем факт в терминалы при двойном щелчке
        private void allFactsListBox_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (allFactsListBox.SelectedItem == null) return;
            addTerminal(parseFactID(allFactsListBox.SelectedItem.ToString()));
        }

        // добавляем факт в начальные при нажатии пробела
        private void allFactsListBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (allFactsListBox.SelectedItem == null) return;
            if (e.KeyCode == Keys.Space)
            {
                addInitialFact(parseFactID(allFactsListBox.SelectedItem.ToString()));
            }
        }

  // удаляем факт из начальных при двойном щелчке по нему
         private void initialFactsListBox_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (initialFactsListBox.SelectedItem == null) return;
            initialFacts.Remove(parseFactID(initialFactsListBox.SelectedItem.ToString()));
            initialFactsListBox.Items.Remove(initialFactsListBox.SelectedItem);
        }

        // удаляем начальный факт из терминалов при двойном щелчке по нему
        private void terminalsListBox_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (terminalsListBox.SelectedItem == null) return;
            terminals.Remove(parseFactID(terminalsListBox.SelectedItem.ToString()));
            terminalsListBox.Items.Remove(terminalsListBox.SelectedItem);
            if (terminals.Count == 0)
            {
                start.Enabled = false;
            }
        }

        
        // запуск CLIPS
        private void start_Click(object sender, EventArgs e)
        {
            textBox2.Text = "";
            clips.Clear();
            clips.LoadFromString(File.ReadAllText(minecraft));
            //получаем список введенных правил
            addFactsToClips();
            finded.Clear();
            foreach (var f in terminals)
            {
                finded[f.Value.Description] = false;
            }
            next.Enabled = true;
            allButton.Enabled = true;
        }

        
        // следующий шаг CLIPS
        private void next_Click(object sender, EventArgs e)
        {
            nextStep();
        }

        private void allButton_Click(object sender, EventArgs e)
        {
            while (nextStep()) ;
        }
    }
}
