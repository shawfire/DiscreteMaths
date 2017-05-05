
# $ rubydoctest data_science.rb
# === Testing 'data_science.rb'...
# 1.   OK  | Default Test
# 15 comparisons, 1 doctests, 0 failures, 0 errors

# Associate information: Speech audio files dataset with language labels
#https://opendata.stackexchange.com/questions/6326/speech-audio-files-dataset-with-language-labels

# >> document = "Hello, Hello"
# => "Hello, Hello"
# >> d = count_trigrams(document)
# => {"Hel"=>2, "ell"=>2, "llo"=>2, "lo,"=>1, "o, "=>1, ", H"=>1, " He"=>1}
def count_trigrams(document)
  dict_counts = Hash.new 0
  (0..document.length-3).each do |i|
      dict_counts[document[i..i+2]] += 1
  end
  return dict_counts
end

# >> document = "Hello, Hello"
# => "Hello, Hello"
# >> d = count_trigrams(document)
# => {"Hel"=>2, "ell"=>2, "llo"=>2, "lo,"=>1, "o, "=>1, ", H"=>1, " He"=>1}
# >> normalise(d)
# => {"Hel"=>0.5, "ell"=>0.5, "llo"=>0.5, "lo,"=>0.25, "o, "=>0.25, ", H"=>0.25, " He"=>0.25}
# >> d
# => {"Hel"=>2, "ell"=>2, "llo"=>2, "lo,"=>1, "o, "=>1, ", H"=>1, " He"=>1}
def normalise(counts_dict)
    """ normalise takes a dictionary of trigram counts counts_dict and
    normalises it by dividing each trigram by the sum of the square counts."""
    normalised_counts = Hash.new 0
    mag = Math.sqrt( counts_dict.values().map{|x| x**2}.reduce(:+) )
    counts_dict.keys().each{|k| normalised_counts[k] = counts_dict[k].to_f/mag }
    return normalised_counts
end

require 'csv'

# >> training_set = "train.csv"
# >> d = train_classifier(training_set)
# >> d.keys
# => ["Indonesian", "Icelandic", "English"]
# >> d['English']['the']
# => 0.3244864121055759
# >> d['English']['no ']
# => 0.011588800432341995
# >> d['Indonesian']['Sal']
# => 0
# >> d['Indonesian']['sal']
# => 0.007433403497766576
def train_classifier(training_set)
    """ train_classifier takes a csv filename training_set as a string and
    returns a dictionary of average trigram-counts per language. """
    train_dict = {}

    CSV.foreach(training_set, encoding: "utf-8") do |row|
      train_dict[row[0]] = normalise(count_trigrams(row[1]))
    end
    return train_dict
end

# We train the classifier here
default_lang_counts = train_classifier('train.csv')

# >> document = "en_20170505_1344.txt"
# >> test1 = 'en_20170505_1344.txt'
# => "en_20170505_1344.txt"
# >> d = score_document(test1, default_lang_counts)
# => {"Indonesian"=>7.095183638618205, "Icelandic"=>2.670804508254296, "English"=>17.17460224073087}
def score_document(document, lang_counts = default_lang_counts)
  results = {}

  # read document
  File.open(document, "r:UTF-8") do |data|

    doc_counts = count_trigrams(data.read)
    #iterations = 0

    # for each lang training data determine the sum of the dot products with the documents triagrams
    for lang in lang_counts.keys()
      sum_counts = 0
      train_counts = lang_counts[lang]
      for trigram in doc_counts.keys()
        #iterations += 1
        sum_counts += doc_counts[trigram] * train_counts[trigram]
      end
      results[lang] = sum_counts
    end
    #print(iterations)
  end
  results
end

# >> document = "en_20170505_1344.txt"
# >> test1 = 'en_20170505_1344.txt'
# => "en_20170505_1344.txt"
# >> classify_doc(document, default_lang_counts)
# => "English"
def classify_doc(document, lang_counts=default_lang_counts)
    d = score_document(document, lang_counts)
    return d.collect{|k,v| [k,v]}.sort_by{|x| x[1]}.reverse[0][0]
end
