//================== Model Related =============================================

enum WordLevel { easy, medium, hard }

enum WordType {
  article,
  pronoun,
  conjunction,
  adjective,
  preposition,
  adverb,
  verb,
  noun,
}

enum BookLevel { easy, medium, hard }

enum BookType {
  educational,
  story,
  movie,
  school,
  novel,
  songs,
  academic,
  general,
}

//================== Logic Related =============================================

enum WordScreenType { addBook, editBook }

enum ScreenLayout { gridView, listView }

enum SearchLoading { search, init, none }

enum SortType { sortAtoZ, sortZtoA, sortNewest, sortOldest, none }
