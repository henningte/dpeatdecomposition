
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dpeatdecomposition: R Interface to the Peatland Decomposition Database

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

`dpeatdecomposition` is an R interface to the Peatland Decomposition
Database. The [Peatland Decomposition Database](---todo:link) (Teickner
and Knorr 2024) stores data from published litterbag experiments related
to peatlands.

`dpeatdecomposition` uses functions from the
[`dm`](https://github.com/cynkra/dm) and
[`RMariaDB`](https://github.com/r-dbi/RMariaDB) package.

## Installation

You can install the development version of dpeatdecomposition like so:

``` r
remotes::install_github("henningte/dpeatdecomposition")
```

You will also need to download the [Peatland Decomposition
Database](---todo) and open it in a running MariaDB instance.

## Example

``` r
library(dpeatdecomposition)

# connect to database
con <-
  RMariaDB::dbConnect(
    drv = RMariaDB::MariaDB(),
    dbname = "dpeatdecomposition",
    default.file = "~/my.cnf"
  )

# get database as dm object
dm_dpeatdecomposition <-
  dpeatdecomposition::dp_get_dm(con, learn_keys = TRUE)

# get information on samples
d <- 
  dm_dpeatdecomposition |>
  dm::pull_tbl(samples) |>
  as.data.frame()

# disconnect
RMariaDB::dbDisconnect(con)
```

# Sources

Datasets currently included in the Peatland Decomposition Database are:
Farrish and Grigal (1985), Bartsch and Moore (1985), Farrish and Grigal
(1988), Vitt (1990), Hogg, Lieffers, and Wein (1992), Sanger, Billett,
and Cresser (1994), Hiroki and Watanabe (1996), Szumigalski and Bayley
(1996), Prevost, Belleau, and Plamondon (1997), Arp, Cooper, and
Stednick (1999), Robbert A. Scheffer and Aerts (2000), R. A. Scheffer,
Van Logtestijn, and Verhoeven (2001), Limpens and Berendse (2003),
Waddington, Rochefort, and Campeau (2003), Asada, Warner, and Banner
(2004), Thormann, Bayley, and Currah (2001), Asada and Warner (2005),
Trinder, Johnson, and Artz (2008), Breeuwer et al. (2008), Trinder,
Johnson, and Artz (2009), Bragazza and Iacumin (2009), Hoorens,
Stroetenga, and Aerts (2010), Straková et al. (2010), Straková et al.
(2012), Orwin and Ostle (2012), Lieffers (1988), Manninen et al. (2016),
Johnson and Damman (1991), Bengtsson, Rydin, and Hájek (2018a),
Bengtsson, Rydin, and Hájek (2018b), Bengtsson, Granath, and Rydin
(2017), Bengtsson, Granath, and Rydin (2016), Hagemann and Moroni
(2015), Hagemann and Moroni (2016), B. Piatkowski et al. (2021), B. T.
Piatkowski et al. (2021), Mäkilä et al. (2018), Golovatskaya and
Nikonova (2017)

# Citation

Cite this package as: Henning Teickner and Klaus-Holger Knorr (2024):
dpeatdecomposition: R Interface to the Peatland Decomposition Database.
—todo: URL. accessed: 2024-05-24.

If you use data from the Peatland Decomposition Database, cite the
database and the [sources](Sources) linked to each entry you use. For
details, see (Teickner and Knorr 2024)

# Contributions

We welcome contributions from everyone. Please note that the
dpeatdecomposition project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

# Acknowledgements

Development of this database was funded by the Deutsche
Forschungsgemeinschaft (DFG, German Research Foundation) grant no. KN
929/23-1 to Klaus-Holger Knorr and grant no. PE 1632/18-1 to Edzer
Pebesma.

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Arp.1999" class="csl-entry">

Arp, Christopher D., David J. Cooper, and John D. Stednick. 1999. “The
Effects of Acid Rock Drainage on *Carex* *Aquatilis* Leaf Litter
Decomposition in Rocky Mountain Fens.” *Wetlands* 19 (3): 665–74.
<https://doi.org/10.1007/BF03161703>.

</div>

<div id="ref-Asada.2005b" class="csl-entry">

Asada, Taro, and Barry G. Warner. 2005. “Surface Peat Mass and Carbon
Balance in a Hypermaritime Peatland.” *Soil Science Society of America
Journal* 69 (2): 549–62. <https://doi.org/10.2136/sssaj2005.0549>.

</div>

<div id="ref-Asada.2004" class="csl-entry">

Asada, Taro, Barry G Warner, and Allen Banner. 2004. “*Sphagnum*
Invasion After Clear-Cutting and Excavator Mounding in a Hypermaritime
Forest of British Columbia.” *Canadian Journal of Forest Research* 34
(8): 1730–46. <https://doi.org/10.1139/x04-042>.

</div>

<div id="ref-Bartsch.1985" class="csl-entry">

Bartsch, I., and T. R. Moore. 1985. “A Preliminary Investigation of
Primary Production and Decomposition in Four Peatlands Near
Schefferville, <span class="nocase">Qu<span
class="nocase">é</span>bec</span>.” *Canadian Journal of Botany* 63 (7):
1241–48. <https://doi.org/10.1139/b85-171>.

</div>

<div id="ref-Bengtsson.2016" class="csl-entry">

Bengtsson, Fia, Gustaf Granath, and Håkan Rydin. 2016. “Photosynthesis,
Growth, and Decay Traits in *Sphagnum* – a Multispecies Comparison.”
*Ecology and Evolution* 6 (10): 3325–41.
<https://doi.org/10.1002/ece3.2119>.

</div>

<div id="ref-Bengtsson.2017" class="csl-entry">

———. 2017. “Data from: Photosynthesis, Growth, and Decay Traits in
*Sphagnum* – a Multispecies Comparison.” Dryad.
<https://doi.org/10.5061/DRYAD.62054>.

</div>

<div id="ref-Bengtsson.2018a" class="csl-entry">

Bengtsson, Fia, Håkan Rydin, and Tomáš Hájek. 2018a. “Data from:
Biochemical Determinants of Litter Quality in 15 Species of *Sphagnum*.”
Dryad. <https://doi.org/10.5061/DRYAD.4F8D2>.

</div>

<div id="ref-Bengtsson.2018" class="csl-entry">

———. 2018b. “Biochemical Determinants of Litter Quality in 15 Species of
*Sphagnum*.” *Plant and Soil* 425 (1-2): 161–76.
<https://doi.org/10.1007/s11104-018-3579-8>.

</div>

<div id="ref-Bragazza.2009" class="csl-entry">

Bragazza, Luca, and Paola Iacumin. 2009. “Seasonal Variation in Carbon
Isotopic Composition of Bog Plant Litter During 3 Years of Field
Decomposition.” *Biology and Fertility of Soils* 46 (1): 73–77.
<https://doi.org/10.1007/s00374-009-0406-7>.

</div>

<div id="ref-Breeuwer.2008" class="csl-entry">

Breeuwer, Angela, Monique Heijmans, Bjorn J. M. Robroek, Juul Limpens,
and Frank Berendse. 2008. “The Effect of Increased Temperature and
Nitrogen Deposition on Decomposition in Bogs.” *Oikos* 117 (8): 1258–68.
<https://doi.org/10.1111/j.0030-1299.2008.16518.x>.

</div>

<div id="ref-Farrish.1985" class="csl-entry">

Farrish, K. W., and D. F. Grigal. 1985. “Mass Loss in a Forested Bog:
Relation to Hummock and Hollow Microrelief.” *Canadian Journal of Soil
Science* 65 (2): 375–78. <https://doi.org/10.4141/cjss85-042>.

</div>

<div id="ref-Farrish.1988" class="csl-entry">

———. 1988. “Decomposition in an Omrotrophic Bog and a Minerotrophic Fen
in Minnesota.” *Soil Science* 145 (5): 353–58.
<https://doi.org/10.1097/00010694-198805000-00005>.

</div>

<div id="ref-Golovatskaya.2017" class="csl-entry">

Golovatskaya, E. A., and L. G. Nikonova. 2017. “The Influence of the Bog
Water Level on the Transformation of Sphagnum Mosses in Peat Soils of
Oligotrophic Bogs.” *Eurasian Soil Science* 50 (5): 580–88.
<https://doi.org/10.1134/S1064229317030036>.

</div>

<div id="ref-Hagemann.2015" class="csl-entry">

Hagemann, Ulrike, and Martin T. Moroni. 2015. “Moss and Lichen
Decomposition in Old-Growth and Harvested High-Boreal Forests Estimated
Using the Litterbag and Minicontainer Methods.” *Soil Biology and
Biochemistry* 87 (August): 10–24.
<https://doi.org/10.1016/j.soilbio.2015.04.002>.

</div>

<div id="ref-Hagemann.2016" class="csl-entry">

———. 2016. “Data on Moss and Lichen Decomposition Rates and Nutrient
Loss from Old-Growth and Harvested High-Boreal Forests Estimated Using
the Litterbag and Minicontainer Methods.” Leibniz-Zentrum für
Agrarlandschaftsforschung (ZALF) e.V.
<https://doi.org/10.4228/ZALF.2007.290>.

</div>

<div id="ref-Hiroki.1996" class="csl-entry">

Hiroki, Mikiya, and Makoto M. Watanabe. 1996. “Microbial Community and
Rate of Cellulose Decomposition in Peat Soils in a Mire.” *Soil Science
and Plant Nutrition* 42 (4): 893–903.
<https://doi.org/10.1080/00380768.1996.10416636>.

</div>

<div id="ref-Hogg.1992" class="csl-entry">

Hogg, Edward H., Victor J. Lieffers, and Ross W. Wein. 1992. “Potential
Carbon Losses from Peat Profiles: Effects of Temperature, Drought
Cycles, and Fire.” *Ecological Applications* 2 (3): 298–306.
<https://doi.org/10.2307/1941863>.

</div>

<div id="ref-Hoorens.2010" class="csl-entry">

Hoorens, Bart, Martin Stroetenga, and Rien Aerts. 2010. “Litter Mixture
Interactions at the Level of Plant Functional Types Are Additive.”
*Ecosystems* 13 (1): 90–98. <https://doi.org/10.1007/s10021-009-9301-1>.

</div>

<div id="ref-Johnson.1991" class="csl-entry">

Johnson, Loretta C., and Antoni W. H. Damman. 1991. “Species-Controlled
*Sphagnum* Decay on a South Swedish Raised Bog.” *Oikos* 61 (2): 234.
<https://doi.org/10.2307/3545341>.

</div>

<div id="ref-Lieffers.1988" class="csl-entry">

Lieffers, V. J. 1988. “*Sphagnum* and Cellulose Decomosition in Drained
and Natural Areas of an Alberta Peatland.” *Canadian Journal of Soil
Science* 68 (4): 755–61. <https://doi.org/10.4141/cjss88-073>.

</div>

<div id="ref-Limpens.2003" class="csl-entry">

Limpens, Juul, and Frank Berendse. 2003. “How Litter Quality Affects
Mass Loss and N Loss from Decomposing *Sphagnum*.” *Oikos* 103 (3):
537–47. <https://doi.org/10.1034/j.1600-0706.2003.12707.x>.

</div>

<div id="ref-Makila.2018" class="csl-entry">

Mäkilä, M., H. Säävuori, A. Grundström, and T. Suomi. 2018. “*Sphagnum*
Decay Patterns and Bog Microtopography in South-Eastern Finland.” *Mires
and Peat*, no. 21 (July): 1–12.
<https://doi.org/10.19189/MaP.2017.OMB.283>.

</div>

<div id="ref-Manninen.2016" class="csl-entry">

Manninen, S., S. Kivimäki, I. D. Leith, S. R. Leeson, and L. J.
Sheppard. 2016. “Nitrogen Deposition Does Not Enhance *Sphagnum*
Decomposition.” *Science of The Total Environment* 571 (November):
314–22. <https://doi.org/10.1016/j.scitotenv.2016.07.152>.

</div>

<div id="ref-Orwin.2012" class="csl-entry">

Orwin, Kate H., and Nicholas J. Ostle. 2012. “Moss Species Effects on
Peatland Carbon Cycling After Fire: Moss Species Effects on C Cycling
After Fire.” *Functional Ecology* 26 (4): 829–36.
<https://doi.org/10.1111/j.1365-2435.2012.01991.x>.

</div>

<div id="ref-Piatkowski.2021" class="csl-entry">

Piatkowski, Bryan T., Joseph B. Yavitt, Merritt R. Turetsky, and A.
Jonathan Shaw. 2021. “Natural Selection on a Carbon Cycling Trait Drives
Ecosystem Engineering by *Sphagnum* (Peat Moss).” *Proceedings of the
Royal Society B: Biological Sciences* 288 (1957): 20210609.
<https://doi.org/10.1098/rspb.2021.0609>.

</div>

<div id="ref-Piatkowski.2021a" class="csl-entry">

Piatkowski, Bryan, Joseph B. Yavitt, Merritt Turetsky, and A. Jonathan
Shaw. 2021. “Online Data for "Natural Selection on a Carbon Cycling
Trait Drives Ecosystem Engineering by *Sphagnum* (Peat Moss).",” August.
<https://doi.org/10.6084/m9.figshare.14109725.v2>.

</div>

<div id="ref-Prevost.1997" class="csl-entry">

Prevost, Marcel, Pierre Belleau, and André P. Plamondon. 1997.
“Substrate Conditions in a Treed Peatland: Responses to Drainage.”
*Écoscience* 4 (4): 543–54.
<https://doi.org/10.1080/11956860.1997.11682434>.

</div>

<div id="ref-Sanger.1994" class="csl-entry">

Sanger, L. J., M. F. Billett, and M. S. Cresser. 1994. “The Effects of
Acidity on Carbon Fluxes from Ombrotrophic Peat.” *Chemistry and
Ecology* 8 (4): 249–64. <https://doi.org/10.1080/02757549408038552>.

</div>

<div id="ref-Scheffer.2001" class="csl-entry">

Scheffer, R. A., R. S. P Van Logtestijn, and J. T. A. Verhoeven. 2001.
“Decomposition of *Carex* and *Sphagnum* Litter in Two Mesotrophic Fens
Differing in Dominant Plant Species.” *Oikos* 92 (1): 44–54.
<https://doi.org/10.1034/j.1600-0706.2001.920106.x>.

</div>

<div id="ref-Scheffer.2000" class="csl-entry">

Scheffer, Robbert A., and Rien Aerts. 2000. “Root Decomposition and Soil
Nutrient and Carbon Cycling in Two Temperate Fen Ecosystems.” *Oikos* 91
(3): 541–49. <https://doi.org/10.1034/j.1600-0706.2000.910316.x>.

</div>

<div id="ref-Strakova.2010" class="csl-entry">

Straková, Petra, Jani Anttila, Peter Spetz, Veikko Kitunen, Tarja
Tapanila, and Raija Laiho. 2010. “Litter Quality and Its Response to
Water Level Drawdown in Boreal Peatlands at Plant Species and Community
Level.” *Plant and Soil* 335 (1-2): 501–20.
<https://doi.org/10.1007/s11104-010-0447-6>.

</div>

<div id="ref-Strakova.2012" class="csl-entry">

Straková, Petra, Timo Penttilä, Jukka Laine, and Raija Laiho. 2012.
“Disentangling Direct and Indirect Effects of Water Table Drawdown on
Above- and Belowground Plant Litter Decomposition: Consequences for
Accumulation of Organic Matter in Boreal Peatlands.” *Global Change
Biology* 18 (1): 322–35.
<https://doi.org/10.1111/j.1365-2486.2011.02503.x>.

</div>

<div id="ref-Szumigalski.1996" class="csl-entry">

Szumigalski, Anthony R., and Suzanne E. Bayley. 1996. “Decomposition
Along a Bog to Rich Fen Gradient in Central Alberta, Canada.” *Canadian
Journal of Botany* 74 (4): 573–81. <https://doi.org/10.1139/b96-073>.

</div>

<div id="ref-Teickner.2024c" class="csl-entry">

Teickner, Henning, and Klaus-Holger Knorr. 2024. “Peatland Decomposition
Database.”

</div>

<div id="ref-Thormann.2001" class="csl-entry">

Thormann, Markus N, Suzanne E Bayley, and Randolph S Currah. 2001.
“Comparison of Decomposition of Belowground and Aboveground Plant
Litters in Peatlands of Boreal Alberta, Canada.” *Canadian Journal of
Botany* 79 (1): 9–22. <https://doi.org/10.1139/b00-138>.

</div>

<div id="ref-Trinder.2008" class="csl-entry">

Trinder, Clare J., David Johnson, and Rebekka R. E. Artz. 2008.
“Interactions Among Fungal Community Structure, Litter Decomposition and
Depth of Water Table in a Cutover Peatland.” *FEMS Microbiology Ecology*
64 (3): 433–48. <https://doi.org/10.1111/j.1574-6941.2008.00487.x>.

</div>

<div id="ref-Trinder.2009" class="csl-entry">

———. 2009. “Litter Type, but Not Plant Cover, Regulates Initial Litter
Decomposition and Fungal Community Structure in a Recolonising Cutover
Peatland.” *Soil Biology and Biochemistry* 41 (3): 651–55.
<https://doi.org/10.1016/j.soilbio.2008.12.006>.

</div>

<div id="ref-Vitt.1990" class="csl-entry">

Vitt, Dale H. 1990. “Growth and Production Dynamics of Boreal Mosses
over Climatic, Chemical and Topographic Gradients.” *Botanical Journal
of the Linnean Society* 104 (1-3): 35–59.
<https://doi.org/10.1111/j.1095-8339.1990.tb02210.x>.

</div>

<div id="ref-Waddington.2003" class="csl-entry">

Waddington, J. M., L. Rochefort, and S. Campeau. 2003. “*Sphagnum*
Production and Decomposition in a Restored Cutover Peatland.” *Wetlands
Ecology and Management* 11 (1): 85–95.
<https://doi.org/10.1023/A:1022009621693>.

</div>

</div>
