enum ProductTypes {
  nameplates,
  dndPanels,
  ledNameplates,
  societyNameBoards,
}

extension ProductTypesExtension on ProductTypes {
  String get name {
    return switch (this) {
      ProductTypes.nameplates => "Nameplates",
      ProductTypes.dndPanels => "DND Panels",
      ProductTypes.ledNameplates => "LED Nameplates",
      ProductTypes.societyNameBoards => "Society Name Boards",
    };
  }
}
