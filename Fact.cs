using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Alchemy
{
    public class Fact
    {
        public int FactID { get; }
        public string Description { get; }

        public Fact(int factID, string description)
        {
            FactID = factID;
            Description = description;
        }

        public override int GetHashCode()
        {
            return FactID.GetHashCode();
        }

        public override bool Equals(object obj)
        {
            if (obj is Fact)
            {
                return FactID == (obj as Fact).FactID;
            }
            return false;
        }

        public override string ToString()
        {
            return $"Fact id: {FactID}, decsription: {Description}";
        }

        public string ToClips()
        {
            return $"(fact (name {Description.Replace(' ', '_')}))";
        }

        public string ToListItem()
        {
            return $"{FactID}. {Description}";
        }

    }
}
