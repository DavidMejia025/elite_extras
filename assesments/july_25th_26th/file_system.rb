# JSON productos categorias, deep con recursion.

def print_file_name(directory)
  if directory[:type] == "file"
    p directory[:name]
    return true
  end

  #return false if directory[:files] == []

  directory[:files].each do |folder|
    print_file_name(folder)
  end
end


#Test

 print_file_name({type: "folder",name: "root",files: []})
 p "end"
 print_file_name(
   {
     type: "folder",
     name: "root",
     files:
       [
         {
           type: "folder",
           name: "documents",
           files: [
             {
               type: "file",
               name: "andres.rb"
             }
           ]
         },
         {type: "file",name:"doc.txt"},
         {type: "file",name:"doc1.txt"},
         {type: "file",name:"doc2.txt"}
       ]
   }
 )

directory =
  {
    type: "folder",
    name: "root",
    files: [
      {
        type: "folder",
        name: "Users",
        files: [
          {
             type: "folder",
             name: "Music",
             files: [
                { type: "file", name: "song1.mp3" },
                { type: "file", name: "song2.mp3" },
                { type: "file", name: "song3.mp3" }
             ]
          },
          {
            type: "folder",
            name: "Projects",
            files: [
              { type: "file", name: "project1.rb" },
              { type: "file", name: "project2.js" },
              {
                type: "folder",
                name: "project3",
                files: [
                  { type: "file", name: "index.js" }
                ]
              }
            ]
          }
        ]
      },
      {
        type: "folder",
        name: "Library",
        files: [
          { type: "file", name: "README.txt" }
        ]
      }
  ]
 }
p "end"
puts ""
p print_file_name(directory)
p "real test"
#print_file_name(directory)

def get_file_name(directory)
  return []                 if directory == [] || directory[:files] == []
  return [directory[:name]] if directory[:type] == "file"

  folder = directory[:files].pop

  return get_file_name(folder) +  get_file_name(directory)
end

p "get file name"
p get_file_name({type: "folder",name: "root",files: []})
p get_file_name({type: "file", name: "one_file.rb"})
puts "end"
p get_file_name({type: "folder",name: "root",files: [{type: "file", name:"test.rb"}]})
puts "end"
p get_file_name(
  {
    type: "folder",
    name: "root",
    files: [
      {type: "file", name:"test4.rb"},
      {type: "file", name:"test2.rb"},
      {type: "file", name:"test1.rb"},
    ]
  }
)
puts "end"
p get_file_name(
  {
    type: "folder",
    name: "root",
    files:
      [
        {
          type: "folder",
          name: "documents",
          files: [
            {type: "file", name: "andres.rb"},
            {type: "file", name: "snatiago.rb"}
          ]
        },
        {type: "file",name:"doc.txt"},
        {type: "file",name:"doc1.txt"},
        {type: "file",name:"doc2.txt"}
      ]
  }
               )
p get_file_name(directory)
