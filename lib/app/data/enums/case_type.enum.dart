enum CaseTypeRefEnum {
  zika("/arboviroses/zikavirus"),
  dengue("/arboviroses/dengue"),
  chikungunya("/arboviroses/chikungunya"),
  febreAHPNH("/arboviroses/febre-amarela-humanos-primatas-nao-humanos");

  final String url;
  const CaseTypeRefEnum(this.url);
}
