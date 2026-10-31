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

enum CrudScreenType { add, edit }

enum WordManagerScreenType { manageWords, selectWords }

enum ScreenLayout { gridView, listView }

enum LoadingStatus { working, init, none }

enum BackupLoading { importLoading, exportLoading, none }

enum SortType { sortAtoZ, sortZtoA, sortNewest, sortOldest }
