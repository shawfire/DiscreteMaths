

# def count_trigrams(document):
#     dict_counts = dd(int)
#     for i in range(0, len(document)-2):
#         dict_counts[document[i:i+3]] += 1
#     return dict_counts

# > document = "Hello, Hello"
# => "Hello, Hello"
# > d = count_trigrams(document)
# => {"Hel"=>2, "ell"=>2, "llo"=>2, "lo,"=>1, "o, "=>1, ", H"=>1, " He"=>1}
def count_trigrams(document)
  dict_counts = Hash.new 0
  (0..document.length-3).each do |i|
      dict_counts[document[i..i+2]] += 1
  end
  return dict_counts
end

# def normalise(counts_dict):
#     """ normalise takes a dictionary of trigram counts counts_dict and
#     normalises it by it's length."""
#     mag = sqrt(sum([x**2 for x in counts_dict.values()]))
#     return dd(int, {key: value/mag for (key, value) in counts_dict.items()})

# > document = "Hello, Hello"
# => "Hello, Hello"
# > d = count_trigrams(document)
# => {"Hel"=>2, "ell"=>2, "llo"=>2, "lo,"=>1, "o, "=>1, ", H"=>1, " He"=>1}
# > normalise(d)
# => {"Hel"=>0.5, "ell"=>0.5, "llo"=>0.5, "lo,"=>0.25, "o, "=>0.25, ", H"=>0.25, " He"=>0.25}
# > d
# => {"Hel"=>2, "ell"=>2, "llo"=>2, "lo,"=>1, "o, "=>1, ", H"=>1, " He"=>1}
def normalise(counts_dict)
    """ normalise takes a dictionary of trigram counts counts_dict and
    normalises it by dividing each trigram by the sum of the square counts."""
    normalised_counts = Hash.new 0
    mag = Math.sqrt( counts_dict.values().map{|x| x**2}.reduce(:+) )
    counts_dict.keys().each{|k| normalised_counts[k] = counts_dict[k].to_f/mag }
    return normalised_counts
end

# def train_classifier(training_set):
#     """ train_classifier takes a csv filename training_set as a string and
#     returns a dictionary of average trigram-counts per language. """
#     # your code here.
#     train_dict = {}
#     # with open(training_set) as csv_file:
#     with open(training_set, newline='', encoding='utf-8') as csv_file:
#         readCSV = csv.reader(csv_file)
#         for row in readCSV:
#             train_trigram_counts = count_trigrams(row[1:][0])
#             print("lang: {}, train_trigram_counts: {}".format(row[0], train_trigram_counts))
#             train_trigram_counts_normalised = normalise(train_trigram_counts)
#             print("lang: {}, train_trigram_counts_normalised: {}".format(row[0], train_trigram_counts_normalised))
#             train_dict[row[0]] = normalise(count_trigrams(row[1:][0]))
#     return train_dict

require CSV

def train_classifier(training_set)
    """ train_classifier takes a csv filename training_set as a string and
    returns a dictionary of average trigram-counts per language. """
    # your code here.
    train_dict = {}
    # with open(training_set) as csv_file:

    #CSV.foreach("train.csv") do |row|

  # use row here...
    #end

    #file_contents = CSV.read("csvfile.csv", col_sep: ",", encoding: "utf-8")
    CSV.foreach(training_set, encoding: "utf-8") do |row|
      train_dict[row[0]] = normalise(count_trigrams(row[1]))
    end

    # with open(training_set, newline='', encoding='utf-8') as csv_file:
    #     readCSV = csv.reader(csv_file)
    #     for row in readCSV:
    #         train_trigram_counts = count_trigrams(row[1:][0])
    #         puts("lang: #{row[0]}, train_trigram_counts: #{train_trigram_counts}")
    #         train_trigram_counts_normalised = normalise(train_trigram_counts)
    #         print("lang: {}, train_trigram_counts_normalised: {}".format(row[0], train_trigram_counts_normalised))
    #         train_dict[row[0]] = normalise(count_trigrams(row[1:][0]))
    return train_dict
end
