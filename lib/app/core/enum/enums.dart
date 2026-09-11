// --- model related
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

// --- logic related
enum CrudScreenType { add, edit }

enum WordManagerScreenType { manageWords, selectWords }

enum ScreenLayout { gridView, listView }

enum LoadingStatus { working, init, none }

enum SortType { sortAtoZ, sortZtoA, sortNewest, sortOldest, none }
