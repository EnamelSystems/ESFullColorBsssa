//
//  ColorMixer.m
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/12.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

#import "ColorMixer.h"

struct color {
    char *name;
    int r;
    int g;
    int b;
};

struct color colorList[] = {
    {"artichoke",240 , 255 , 230},
    {"arbutus",152 , 143 , 143},
    {"almond",210 , 180 , 130},
    {"almond green" , 128 , 204, 128 },
    {"almond shell" , 170 , 108, 44 },
    {"iron blue" , 58 , 72, 97 },
    {"icicle pink" , 247 , 151, 152 },
    {"ice green" , 198 , 255, 215 },
    {"ice beige" , 221 , 189, 178 },
    {"ice white" , 242 , 255, 252 },
    {"iceland blue" , 182 , 209, 225 },
    {"ivy",44 , 176 , 83},
    {"ivy green" , 76 , 103, 51 },
    {"ivy gray" , 75 , 87, 81 },
    {"eye brown" , 112 , 81, 68 },
    {"ivory",222 , 210 , 191},
    {"ivory black" , 64 , 56, 57 },
    {"ivory white" , 255 , 247, 242 },
    {"iris",146 , 1 , 120},
    {"iris green" , 163 , 172, 130 },
    {"iris blue" , 120 , 70, 255 },
    {"outerspace blue" , 70 , 55, 90 },
    {"agatt",166 , 21 , 0},
    {"academy blue" , 105 , 110, 215 },
    {"acapulco",0 , 98 , 124},
    {"acapulco blue" , 99 , 189, 224 },
    {"aqua",148 , 196 , 235},
    {"aqua green" , 155 , 255, 203 },
    {"aqua gray" , 102 , 153, 204 },
    {"aqua spray" , 149 , 255, 207 },
    {"aquatint",195 , 255 , 245},
    {"aqua blue" , 128 , 255, 255 },
    {"aquamarine",64 , 128 , 128},
    {"auqarius",95 , 125 , 115},
    {"akbar",119 , 18 , 15},
    {"acropolis",244 , 222 , 196},
    {"aconite yellow" , 255 , 240, 179 },
    {"aconite violet" , 102 , 16, 101 },
    {"azale'e",208 , 64 , 129},
    {"azalea",202 , 77 , 134},
    {"azalea pink" , 255 , 51, 153 },
    {"azalea orange" , 211 , 89, 30 },
    {"azure",49 , 0 , 178},
    {"azure blue" , 106 , 180, 214 },
    {"ash gray" , 158 , 148, 120 },
    {"aster",77 , 78 , 115},
    {"aster purple" , 116 , 47, 75 },
    {"aster hou" , 160 , 90, 185 },
    {"aztec brown" , 79 , 45, 35 },
    {"aztec blue" , 0 , 108, 171 },
    {"asparagus",204 , 255 , 153},
    {"asparagus green" , 70 , 110, 77 },
    {"asphalt",81 , 43 , 43},
    {"azurite",0 , 37 , 176},
    {"azurite green" , 26 , 255, 71 },
    {"of rose" , 184 , 109, 119 },
    {"ash grey" , 143 , 143, 143 },
    {"apple green" , 162 , 210, 158 },
    {"apple blossom" , 230 , 150, 170 },
    {"attic rose" , 156 , 0, 46 },
    {"athena",170 , 83 , 89},
    {"atun manto" , 189 , 166, 187 },
    {"adobe brown" , 127 , 96, 54 },
    {"adonis blue" , 0 , 103, 142 },
    {"atmos green" , 150 , 180, 100 },
    {"atlantic blue" , 0 , 170, 214 },
    {"adriatic blue" , 0 , 158, 195 },
    {"anise",240 , 255 , 179},
    {"anemone",214 , 51 , 255},
    {"apache green" , 0 , 211, 111 },
    {"afghan",68 , 38 , 37},
    {"absinthe green" , 143 , 153, 102 },
    {"african violet" , 99 , 83, 237 },
    {"african brown" , 85 , 52, 44 },
    {"apricot",216 , 159 , 109},
    {"aphrodite",179 , 255 , 219},
    {"avenue green" , 67 , 138, 0 },
    {"avovat",83 , 102 , 0},
    {"apollo",255 , 142 , 0},
    {"amazon",67 , 126 , 0},
    {"amaranth purple" , 153 , 0, 153 },
    {"amaranth pink" , 210 , 102, 152 },
    {"amaranth red" , 255 , 51, 255 },
    {"amaranto",149 , 0 , 68},
    {"amigo blue" , 126 , 207, 255 },
    {"amulet green" , 16 , 92, 89 },
    {"amuburozia",255 , 156 , 108},
    {"amethyst",116 , 0 , 132},
    {"amethyst violet" , 79 , 32, 82 },
    {"aragon orange" , 253 , 104, 13 },
    {"aladdin's lamp" , 232 , 113, 113 },
    {"arras green" , 60 , 80, 61 },
    {"alabaster",252 , 223 , 212},
    {"arabian blue" , 0 , 153, 122 },
    {"arabesque tag" , 0 , 134, 159 },
    {"alhambra",99 , 83 , 121},
    {"aristoteles",187 , 74 , 108},
    {"aliceblue",240 , 248 , 255},
    {"alice mauve" , 159 , 85, 136 },
    {"arcadia",0 , 255 , 153},
    {"algerian red" , 76 , 19, 31 },
    {"altrose",171 , 140 , 217},
    {"aruno blue" , 60 , 132, 144 },
    {"albatre",230 , 240 , 255},
    {"alpine green" , 46 , 87, 40 },
    {"alpine blue" , 165 , 206, 231 },
    {"blue green" , 55 , 110, 40 },
    {"alhambra",126 , 126 , 215},
    {"aluminium",102 , 204 , 191},
    {"aluminium gray" , 131 , 131, 131 },
    {"anca",103 , 28 , 19},
    {"antique white" , 250 , 235, 215 },
    {"antique mauve" , 145 , 90, 135 },
    {"andes copper" , 115 , 60, 77 },
    {"amber",170 , 122 , 64},
    {"amber white" , 204 , 198, 183 },
    {"amber rose" , 230 , 179, 189 },
    {"eos",248 , 113 , 138},
    {"aegean blue" , 138 , 207, 255 },
    {"eve green" , 78 , 162, 96 },
    {"jena",190 , 153 , 23},
    {"yellow",255 , 212 , 0},
    {"yellow ochre" , 184 , 136, 59 },
    {"yellow cab" , 255 , 200, 0 },
    {"yellowgreen",154 , 205 , 50},
    {"yellow submarine" , 255 , 220, 118 },
    {"yellow tint" , 232 , 228, 198 },
    {"istanbul dawn" , 255 , 67, 113 },
    {"italian blue" , 51 , 255, 255 },
    {"italian rose" , 244 , 80, 109 },
    {"ink black" , 62 , 67, 74 },
    {"ink blue" , 0 , 25, 60 },
    {"english ivy" , 0 , 96, 71 },
    {"english red" , 212 , 116, 103 },
    {"indian yellow" , 255 , 151, 0 },
    {"indian star" , 218 , 228, 225 },
    {"indian red" , 88 , 0, 25 },
    {"indigo",24 , 47 , 99},
    {"independence navy" , 69 , 0, 145 },
    {"ndependence navy" , 0 , 36, 212 },
    {"india pink" , 255 , 26, 117 },
    {"imperial jade" , 0 , 204, 51 },
    {"vinas",209 , 165 , 172},
    {"vandike brown" , 127 , 81, 57 },
    {"wheat",221 , 167 , 112},
    {"victorian mauve" , 144 , 69, 174 },
    {"whisky",220 , 140 , 20},
    {"wisteria",190 , 175 , 255},
    {"wistaria",121 , 103 , 195},
    {"wiataria purple" , 174 , 147, 192 },
    {"willow green" , 140 , 140, 89 },
    {"windsor blue" , 99 , 149, 255 },
    {"winter sky" , 92 , 114, 138 },
    {"winter blue" , 50 , 70, 100 },
    {"winter leaf" , 95 , 65, 51 },
    {"winter rose" , 200 , 99, 121 },
    {"vintage wine" , 85 , 22, 40 },
    {"oolong",160 , 85 , 62},
    {"vert anglais" , 133 , 153, 51 },
    {"vert scarabe" , 26 , 255, 117 },
    {"vert nil" , 230 , 255, 128 },
    {"vert noir" , 51 , 41, 0 },
    {"vert bouteille" , 26 , 77, 46 },
    {"vert fonce" , 26 , 77, 36 },
    {"vesta",255 , 131 , 135},
    {"westminster",0 , 0 , 195},
    {"wedgwood",90 , 140 , 179},
    {"wedgewood",138 , 198 , 240},
    {"wedgewood blue" , 80 , 91, 140 },
    {"venit",56 , 145 , 146},
    {"venezia",178 , 230 , 211},
    {"verdigris",91 , 160 , 128},
    {"weld",193 , 188 , 85},
    {"verona",138 , 240 , 207},
    {"water green" , 178 , 178, 151 },
    {"water blue" , 102 , 162, 168 },
    {"water mint" , 153 , 255, 194 },
    {"meron rose" , 208 , 0, 74 },
    {"volkan",167 , 0 , 31},
    {"voltaire",198 , 211 , 226},
    {"walnut",193 , 132 , 96},
    {"woodland brown" , 70 , 46, 48 },
    {"ulsan",255 , 131 , 4},
    {"ultramarine",69 , 0 , 183},
    {"ultramarine blue" , 56 , 77, 152 },
    {"airway blue" , 126 , 198, 255 },
    {"april mist" , 150 , 180, 180 },
    {"ether",255 , 204 , 255},
    {"edelweiss",255 , 243 , 225},
    {"erika",178 , 89 , 121},
    {"ehle",210 , 235 , 250},
    {"ecarlate",255 , 32 , 16},
    {"ecume",255 , 255 , 153},
    {"e'cru",195 , 172 , 137},
    {"ecru beige" , 245 , 205, 166 },
    {"echo",128 , 204 , 204},
    {"echo blue" , 150 , 155, 183 },
    {"egyption green" , 46 , 113, 87 },
    {"egyption green" , 255 , 172, 106 },
    {"egyptian blue" , 0 , 103, 133 },
    {"egyptian red" , 108 , 0, 26 },
    {"etain blue" , 156 , 184, 190 },
    {"egg shell" , 250 , 236, 208 },
    {"eggshell green" , 135 , 172, 158 },
    {"eggplant",121 , 42 , 112},
    {"edo purple" , 74 , 51, 97 },
    {"etruscan rose" , 176 , 117, 92 },
    {"enamel blue" , 0 , 55, 95 },
    {"ever green" , 97 , 135, 36 },
    {"epinard",0 , 126 , 0},
    {"email.",255 , 230 , 128},
    {"emerald",42 , 153 , 87},
    {"emerald green" , 0 , 164, 116 },
    {"emerald tint" , 175 , 208, 192 },
    {"elder berry" , 0 , 0, 51 },
    {"herbe",102 , 204 , 153},
    {"elfenbein",255 , 233 , 214},
    {"elm green" , 106 , 118, 92 },
    {"electric blue" , 0 , 102, 153 },
    {"elephant gray" , 116 , 103, 90 },
    {"eros",255 , 142 , 194},
    {"angel blue" , 195 , 195, 250 },
    {"ancient blue" , 215 , 175, 0 },
    {"endaibu",255 , 229 , 140},
    {"enchantress",232 , 113 , 99},
    {"enchantress",221 , 89 , 59},
    {"ember last" , 171 , 30, 54 },
    {"empire",19 , 141 , 87},
    {"empire yellow" , 196 , 170, 45 },
    {"empire green" , 11 , 114, 54 },
    {"empire violet" , 60 , 52, 65 },
    {"empire blue" , 26 , 74, 139 },
    {"empire rose" , 240 , 134, 135 },
    {"emperor green" , 55 , 155, 101 },
    {"oasis",154 , 198 , 65},
    {"oyster",210 , 200 , 170},
    {"oyster gray" , 206 , 192, 189 },
    {"oyster white" , 249 , 242, 228 },
    {"oil yellow" , 204 , 153, 51 },
    {"ocher",186 , 140 , 53},
    {"orchid",198 , 156 , 197},
    {"orchid gray" , 185 , 183, 190 },
    {"orchid pink" , 255 , 102, 204 },
    {"orchid white" , 214 , 203, 199 },
    {"orchid mist" , 118 , 107, 130 },
    {"ocean",0 , 77 , 112},
    {"ocean green" , 118 , 250, 141 },
    {"ocean surf" , 80 , 125, 120 },
    {"autumn azure" , 30 , 0, 170 },
    {"autumn glory" , 177 , 7, 47 },
    {"autumn azure" , 67 , 113, 255 },
    {"autumn leaf" , 180 , 75, 50 },
    {"auripigment",247 , 203 , 74},
    {"aubergine",55 , 16 , 75},
    {"old gold" , 191 , 91, 25 },
    {"old china" , 51 , 80, 98 },
    {"old pansy" , 90 , 65, 111 },
    {"old blue" , 102 , 149, 157 },
    {"old lilac" , 204 , 102, 153 },
    {"old raspberry" , 190 , 100, 135 },
    {"oldlace",253 , 245 , 230},
    {"old rose" , 198 , 122, 133 },
    {"old wine" , 103 , 45, 50 },
    {"aurora",255 , 143 , 117},
    {"aurora pink" , 255 , 194, 217 },
    {"oxide red" , 127 , 51, 48 },
    {"othello",94 , 75 , 66},
    {"otter gray" , 140 , 120, 110 },
    {"oxford blue" , 54 , 52, 56 },
    {"oxblood",89 , 3 , 34},
    {"oparin green" , 245 , 255, 242 },
    {"opal green" , 228 , 255, 179 },
    {"opal peach" , 230 , 180, 185 },
    {"opal mouve" , 194 , 166, 174 },
    {"ophelia",164 , 255 , 207},
    {"ophelia",122 , 199 , 190},
    {"obsidian",10 , 10 , 10},
    {"off black" , 33 , 35, 33 },
    {"off white" , 255 , 255, 230 },
    {"opera",157 , 0 , 54},
    {"opera mauve" , 236 , 156, 186 },
    {"omega blue" , 0 , 126, 232 },
    {"orage",93 , 120 , 131},
    {"olive",92 , 84 , 36},
    {"olive yellow" , 140 , 100, 0 },
    {"olive green" , 87 , 85, 49 },
    {"olive gray" , 140 , 155, 140 },
    {"olive shade" , 255 , 51, 51 },
    {"olive drab" , 101 , 95, 71 },
    {"olive pass'e" , 153 , 153, 0 },
    {"olive brown" , 104 , 72, 7 },
    {"oriental blue" , 48 , 66, 133 },
    {"olient blue" , 45 , 116, 166 },
    {"olympia green" , 142 , 255, 160 },
    {"olympic",0 , 164 , 196},
    {"orange",239 , 129 , 15},
    {"orange vermillion" , 246 , 79, 79 },
    {"orange peal" , 244 , 121, 32 },
    {"orange flame" , 209 , 75, 34 },
    {"orange red" , 255 , 69, 0 },
    {"ontario violet" , 145 , 143, 163 },
    {"khaki",176 , 110 , 53},
    {"gargoyle",77 , 81 , 79},
    {"guardsman red" , 153 , 38, 52 },
    {"garter blue" , 0 , 83, 141 },
    {"cardinal",136 , 30 , 56},
    {"cardinal red" , 180 , 0, 0 },
    {"gerden grass" , 96 , 138, 101 },
    {"garden pool" , 222 , 239, 234 },
    {"arnival",232 , 0 , 44},
    {"carnival red" , 188 , 34, 64 },
    {"carnation",189 , 9 , 67},
    {"carnation pink" , 242 , 80, 118 },
    {"garnet",128 , 0 , 64},
    {"garnet brown" , 153 , 0, 0 },
    {"garnet red" , 129 , 49, 65 },
    {"carbon black" , 0 , 0, 0 },
    {"carmine",190 , 0 , 57},
    {"garland green" , 75 , 94, 66 },
    {"cayenne",213 , 63 , 23},
    {"cairo",0 , 116 , 189},
    {"cactus green" , 120 , 128, 102 },
    {"kashmir green" , 0 , 211, 109 },
    {"kashmir",255 , 224 , 204},
    {"cascade",126 , 188 , 196},
    {"castile gold" , 255 , 195, 0 },
    {"catalan brown" , 81 , 43, 38 },
    {"copper",191 , 0 , 223},
    {"copper green" , 163 , 255, 102 },
    {"copper red" , 175 , 64, 32 },
    {"cadiz blue" , 83 , 160, 240 },
    {"cadet blue" , 95 , 158, 160 },
    {"cathedral",42 , 13 , 52},
    {"cadmium orange" , 255 , 187, 113 },
    {"canary",255 , 249 , 0},
    {"canary yellow" , 237 , 214, 52 },
    {"covert brown" , 76 , 70, 54 },
    {"coffee",90 , 60 , 34},
    {"cafe",128 , 65 , 50},
    {"au lait" , 200 , 134, 89 },
    {"coptic",130 , 6 , 43},
    {"capri blue" , 0 , 128, 159 },
    {"cameo cream" , 255 , 230, 240 },
    {"cameo pink" , 210 , 140, 150 },
    {"cameo beige" , 241 , 207, 194 },
    {"camellia",255 , 25 , 128},
    {"curry",176 , 119 , 54},
    {"carinho pink" , 243 , 76, 102 },
    {"californiy",0 , 89 , 128},
    {"calcutta curry" , 224 , 145, 64 },
    {"gull gray" , 152 , 167, 165 },
    {"carmen coral" , 233 , 30, 90 },
    {"carotte",225 , 96 , 96},
    {"ganges",85 , 117 , 25},
    {"canterbury rose" , 212 , 54, 81 },
    {"kant",207 , 203 , 188},
    {"canton green" , 0 , 171, 117 },
    {"canton red" , 248 , 0, 0 },
    {"campanula",115 , 77 , 135},
    {"campanula mauve" , 136 , 104, 153 },
    {"campanula purple" , 142 , 91, 146 },
    {"gambian",123 , 68 , 17},
    {"gamboge",226 , 181 , 91},
    {"gun metal" , 46 , 30, 41 },
    {"cactus green" , 29 , 114, 115 },
    {"canary",227 , 225 , 28},
    {"cabaret",80 , 116 , 115},
    {"cavia",69 , 82 , 77},
    {"cabbage",194 , 255 , 153},
    {"camel",188 , 138 , 83},
    {"caravan camel" , 224 , 154, 102 },
    {"caramel",190 , 125 , 55},
    {"carrot",253 , 105 , 33},
    {"carrot orange" , 197 , 84, 49 },
    {"chianti",98 , 0 , 26},
    {"campus green" , 160 , 255, 0 },
    {"campus blue" , 95 , 90, 215 },
    {"cupid pink" , 255 , 153, 235 },
    {"kingfisher blue" , 0 , 175, 175 },
    {"queen anne" , 125 , 152, 94 },
    {"goose gray" , 50 , 57, 52 },
    {"de foudre" , 232 , 22, 25 },
    {"coolcopper",191 , 191 , 223},
    {"courbet",174 , 77 , 42},
    {"knossos",130 , 48 , 22},
    {"claret",102 , 0 , 51},
    {"cloudy pink" , 170 , 150, 160 },
    {"cloud blue" , 85 , 85, 100 },
    {"gladiolus",255 , 51 , 255},
    {"classic rose" , 230 , 179, 204 },
    {"grass green" , 115 , 124, 62 },
    {"grasshopper",120 , 140 , 35},
    {"granat",174 , 0 , 51},
    {"granada",118 , 78 , 78},
    {"cranach",117 , 101 , 54},
    {"graphite",61 , 50 , 47},
    {"kravet",202 , 91 , 86},
    {"clear sky" , 55 , 125, 120 },
    {"grecian olive" , 77 , 86, 79 },
    {"grecian bronze" , 90 , 83, 60 },
    {"grecian rose" , 250 , 150, 133 },
    {"cream",255 , 252 , 208},
    {"cream yellow" , 228 , 211, 162 },
    {"green",0 , 154 , 87},
    {"green yellow" , 173 , 255, 47 },
    {"green shadow" , 54 , 83, 75 },
    {"green tea" , 183 , 186, 107 },
    {"green froth" , 230 , 255, 190 },
    {"green haze" , 204 , 230, 204 },
    {"green muscat" , 170 , 180, 0 },
    {"green mist" , 215 , 216, 204 },
    {"gris orage" , 242 , 217, 242 },
    {"cricket green" , 0 , 147, 116 },
    {"crystal shade" , 153 , 255, 173 },
    {"christrose",228 , 0 , 57},
    {"christmas green" , 0 , 121, 0 },
    {"greenwich",126 , 232 , 67},
    {"greenish yellow" , 220 , 227, 62 },
    {"glimmer green" , 145 , 153, 120 },
    {"crimson rake" , 170 , 0, 68 },
    {"crimson",220 , 20 , 60},
    {"crevette",255 , 102 , 102},
    {"clay",207 , 160 , 99},
    {"gray",118 , 118 , 118},
    {"gray quartz" , 122 , 91, 82 },
    {"glacier blue" , 85 , 142, 146 },
    {"grayish blue" , 91 , 164, 162 },
    {"grayish lavender" , 91 , 164, 162 },
    {"grayish red" , 198 , 153, 153 },
    {"grege",158 , 117 , 108},
    {"grape",40 , 0 , 64},
    {"grape gleam" , 62 , 0, 240 },
    {"grape gray" , 111 , 86, 93 },
    {"cleves",228 , 48 , 21},
    {"grapefruit green" , 220 , 255, 0 },
    {"creme",255 , 231 , 172},
    {"creopatola",0 , 160 , 184},
    {"crescent gold" , 240 , 190, 75 },
    {"gremlin green" , 149 , 232, 0 },
    {"crayon green" , 186 , 219, 184 },
    {"glaucas",182 , 190 , 162},
    {"clove",219 , 186 , 86},
    {"clove brown" , 91 , 49, 45 },
    {"chrome yellow" , 213 , 191, 0 },
    {"chrome orange" , 254 , 109, 13 },
    {"chrome green" , 0 , 136, 95 },
    {"crocodile grun" , 0 , 79, 87 },
    {"crocus yellow" , 194 , 179, 255 },
    {"grotto green" , 0 , 107, 104 },
    {"grotto blue" , 51 , 117, 141 },
    {"chrome yellow" , 246 , 191, 0 },
    {"gay green" , 92 , 112, 10 },
    {"gainsboro",220 , 220 , 220},
    {"oethe",0 , 83 , 255},
    {"ketchup",156 , 0 , 45},
    {"kenya red" , 115 , 3, 51 },
    {"kelly green" , 0 , 113, 65 },
    {"kentucky",96 , 145 , 76},
    {"kendal green" , 55 , 77, 65 },
    {"cambridge blue" , 119 , 160, 157 },
    {"gauguin orange" , 254 , 105, 44 },
    {"coke",86 , 44 , 43},
    {"ghostwhite",248 , 248 , 255},
    {"godey green" , 80 , 122, 73 },
    {"cote d'azur" , 0 , 106, 240 },
    {"coffee",102 , 61 , 24},
    {"coffee brown" , 60 , 6, 15 },
    {"corfu blue" , 43 , 115, 140 },
    {"coral",245 , 80 , 90},
    {"coral shell" , 255 , 167, 155 },
    {"coral tint" , 237 , 171, 161 },
    {"coral pink" , 255 , 152, 136 },
    {"coral leaf" , 40 , 115, 125 },
    {"coral red" , 255 , 127, 143 },
    {"golden yellow" , 232 , 154, 60 },
    {"golden ochre" , 152 , 106, 30 },
    {"golden orenge" , 255 , 128, 0 },
    {"golden glow" , 212 , 164, 47 },
    {"golden cone" , 255 , 200, 146 },
    {"golden buff" , 216 , 166, 94 },
    {"goldenrod",218 , 165 , 32},
    {"gold",255 , 215 , 0},
    {"gold spark" , 255 , 190, 5 },
    {"corn",224 , 195 , 132},
    {"corn silk" , 255 , 248, 220 },
    {"corn flower" , 57 , 74, 144 },
    {"flower blue" , 63 , 77, 146 },
    {"corn brond" , 255 , 185, 80 },
    {"coca brown" , 165 , 112, 78 },
    {"coquelicot",206 , 56 , 43},
    {"cocoa",97 , 45 , 38},
    {"cocoa brown" , 112 , 75, 56 },
    {"cocoa whip" , 155 , 120, 120 },
    {"coconuts brown" , 64 , 40, 0 },
    {"cossack",66 , 97 , 92},
    {"cossack green" , 44 , 82, 58 },
    {"gothic purple" , 85 , 5, 60 },
    {"cosmique",44 , 170 , 255},
    {"cosmos",255 , 0 , 255},
    {"gosling green" , 86 , 70, 47 },
    {"cochineal",243 , 0 , 75},
    {"cochineal red" , 174 , 43, 82 },
    {"gosamer green" , 146 , 204, 200 },
    {"cognac",146 , 99 , 68},
    {"copper tan" , 133 , 86, 77 },
    {"copper luster" , 151 , 80, 41 },
    {"copper rust" , 158 , 74, 52 },
    {"copper rose" , 225 , 106, 89 },
    {"cobalt green" , 9 , 194, 137 },
    {"green blue" , 68 , 86, 161 },
    {"cobalt violet" , 162 , 105, 168 },
    {"cobalt blue" , 0 , 98, 160 },
    {"copenhagen",101 , 200 , 222},
    {"comet blue" , 70 , 140, 255 },
    {"goya",191 , 0 , 53},
    {"corinth pink" , 222 , 163, 156 },
    {"corinth rose" , 177 , 103, 106 },
    {"cork",159 , 124 , 92},
    {"corelle",174 , 0 , 54},
    {"colonial yellow" , 228 , 193, 126 },
    {"colonial rose" , 174 , 91, 94 },
    {"colorado",198 , 83 , 67},
    {"gauloise",138 , 224 , 255},
    {"columbine pink" , 202 , 172, 203 },
    {"columbine blue" , 126 , 96, 168 },
    {"congo brown" , 146 , 60, 30 },
    {"concumbre",207 , 255 , 170},
    {"surf green" , 50 , 137, 118 },
    {"schedule",217 , 186 , 140},
    {"salmon",250 , 128 , 114},
    {"salmon buff" , 241 , 174, 146 },
    {"salmon pink" , 255 , 158, 140 },
    {"sari green" , 122 , 168, 33 },
    {"sari peach" , 229 , 46, 63 },
    {"cyan blue" , 93 , 187, 184 },
    {"cypress green" , 25 , 79, 50 },
    {"sear green" , 15 , 135, 59 },
    {"outherncross",115 , 135 , 250},
    {"satan's spark" , 240 , 0, 0 },
    {"sakkara",84 , 40 , 33},
    {"saxe blue" , 90 , 121, 147 },
    {"sap green" , 72 , 81, 61 },
    {"satinwood",229 , 192 , 146},
    {"saddlebrown",139 , 69 , 19},
    {"sea blue" , 0 , 135, 180 },
    {"sahara",201 , 152 , 106},
    {"savanna",135 , 125 , 50},
    {"sapphire blue" , 0 , 77, 106 },
    {"safari",70 , 84 , 64},
    {"saffran yellow" , 255 , 175, 0 },
    {"summer sun" , 255 , 255, 64 },
    {"summer shower" , 230 , 255, 235 },
    {"samoa tapa" , 144 , 50, 29 },
    {"salad green" , 165 , 255, 75 },
    {"solitary",235 , 244 , 239},
    {"solitary blue" , 80 , 90, 100 },
    {"salamander",232 , 22 , 21},
    {"salvia blue" , 110 , 122, 172 },
    {"salvia red" , 217 , 70, 71 },
    {"sulphar yellow" , 255 , 255, 51 },
    {"sallow",204 , 230 , 190},
    {"sarome pink" , 255 , 154, 156 },
    {"sun orange" , 255 , 181, 119 },
    {"sun capcine" , 255 , 126, 83 },
    {"sung green" , 51 , 88, 82 },
    {"gray mouve" , 172 , 169, 179 },
    {"zanzibar",255 , 0 , 83},
    {"sun stone" , 204 , 119, 103 },
    {"sunset",230 , 25 , 0},
    {"sunset sky" , 255 , 99, 99 },
    {"sunset red" , 209 , 75, 34 },
    {"thunder blue" , 94 , 99, 108 },
    {"sun down" , 202 , 170, 138 },
    {"santan",195 , 111 , 24},
    {"sandybrown",244 , 164 , 96},
    {"sand",121 , 121 , 70},
    {"santosu",99 , 61 , 51},
    {"sand beige" , 242 , 217, 227 },
    {"cendrillon",58 , 85 , 81},
    {"sunburn",175 , 124 , 84},
    {"sunbeam",240 , 204 , 51},
    {"sunflower",255 , 192 , 0},
    {"sunrise yellow" , 255 , 162, 85 },
    {"sunlight",252 , 224 , 162},
    {"sunlight yellow" , 255 , 144, 70 },
    {"cyan",0 , 156 , 209},
    {"sea green" , 0 , 169, 167 },
    {"sea shell" , 255 , 245, 238 },
    {"shell pink" , 255 , 193, 177 },
    {"sea spray" , 150 , 177, 153 },
    {"sheba",0 , 62 , 62},
    {"sea foam" , 94 , 169, 129 },
    {"foam green" , 189 , 206, 150 },
    {"sea fog" , 153 , 102, 153 },
    {"sea moss" , 124 , 127, 0 },
    {"shakspeare",44 , 44 , 179},
    {"jode",51 , 153 , 102},
    {"jode green" , 115 , 112, 79 },
    {"jay blue" , 54 , 149, 254 },
    {"shesta beige" , 131 , 82, 72 },
    {"sienna",244 , 143 , 55},
    {"geneva blue" , 39 , 46, 74 },
    {"shell pink" , 249 , 201, 185 },
    {"gentian",75 , 110 , 158},
    {"gentian blue" , 134 , 129, 173 },
    {"signal green" , 0 , 180, 20 },
    {"signal red" , 206 , 33, 67 },
    {"cyclamen",174 , 0 , 82},
    {"cyclamen pink" , 255 , 140, 255 },
    {"sicillian amber" , 139 , 82, 46 },
    {"cysteine mauve" , 168 , 149, 162 },
    {"thistle",130 , 39 , 89},
    {"citrus yellow" , 221 , 232, 148 },
    {"citron yellow" , 204 , 204, 0 },
    {"citron green" , 170 , 200, 30 },
    {"citron gray" , 229 , 204, 151 },
    {"citron mist" , 255 , 240, 200 },
    {"cinnabar",225 , 90 , 40},
    {"cinnamon",193 , 96 , 48},
    {"cinnamon brown" , 127 , 96, 54 },
    {"chinoiserie",149 , 127 , 100},
    {"siva",33 , 126 , 102},
    {"cement",158 , 143 , 137},
    {"shake skin" , 102 , 102, 204 },
    {"chagall blau" , 25 , 160, 255 },
    {"jasper green" , 54 , 131, 115 },
    {"jasper red" , 208 , 77, 79 },
    {"jasmine",255 , 202 , 124},
    {"shut iron" , 238 , 236, 249 },
    {"shadow blue" , 51 , 74, 83 },
    {"chartreuse",127 , 255 , 0},
    {"chartreuse yellow" , 230 , 221, 81 },
    {"chartreuse green" , 190 , 190, 104 },
    {"chamois",247 , 194 , 194},
    {"de jem" , 89 , 0, 39 },
    {"chalet blue" , 126 , 232, 255 },
    {"jyawa",72 , 39 , 31},
    {"jungle green" , 0 , 40, 29 },
    {"champagne",231 , 191 , 124},
    {"champagne",233 , 215 , 163},
    {"champagne bubble" , 255 , 240, 215 },
    {"champignon",170 , 142 , 134},
    {"schweinfurt green" , 0 , 174, 66 },
    {"schwarzwald",0 , 33 , 29},
    {"chourouge",102 , 0 , 84},
    {"june bud" , 20 , 190, 0 },
    {"sugar beet" , 130 , 0, 65 },
    {"june",255 , 148 , 77},
    {"shune",247 , 252 , 254},
    {"jupiter blue" , 15 , 110, 105 },
    {"supreme",0 , 75 , 139},
    {"shrimp pink" , 220 , 117, 99 },
    {"joy",189 , 255 , 189},
    {"john citron" , 255 , 230, 118 },
    {"de nurple" , 255 , 198, 136 },
    {"john miel" , 224 , 154, 16 },
    {"chocolat",89 , 47 , 36},
    {"shocking pink" , 255 , 0, 153 },
    {"jaune brillant" , 244 , 213, 0 },
    {"zircon blue" , 162 , 203, 201 },
    {"silver",192 , 192 , 192},
    {"silver green" , 206 , 226, 197 },
    {"silver gray" , 156 , 156, 156 },
    {"silver sky" , 140 , 217, 217 },
    {"silver sage" , 151 , 161, 132 },
    {"silver pine" , 139 , 169, 155 },
    {"silver pink" , 230 , 204, 204 },
    {"silver white" , 205 , 212, 215 },
    {"celestial blue" , 73 , 111, 142 },
    {"zink white" , 196 , 197, 182 },
    {"ginger",150 , 89 , 30},
    {"cinderella",255 , 195 , 71},
    {"sindbad purple" , 172 , 0, 97 },
    {"symphony blue" , 20 , 85, 255 },
    {"sweet hearts" , 183 , 0, 56 },
    {"sweetpea",218 , 177 , 198},
    {"sweet bluette" , 128 , 255, 255 },
    {"swiss chocolate" , 46 , 22, 23 },
    {"swiss rose" , 177 , 1, 55 },
    {"swedish green" , 126 , 128, 97 },
    {"suede",177 , 102 , 0},
    {"sudan brown" , 180 , 105, 22 },
    {"soot brown" , 118 , 98, 83 },
    {"zulu",113 , 67 , 83},
    {"scarlet",222 , 56 , 56},
    {"sky grey" , 179 , 184, 187 },
    {"sky blue" , 137 , 189, 222 },
    {"sky mint" , 217 , 242, 242 },
    {"scarable blue" , 0 , 0, 81 },
    {"scarable",52 , 132 , 33},
    {"skwal",111 , 150 , 166},
    {"squash yellow" , 237 , 201, 72 },
    {"scotch pine" , 0 , 85, 81 },
    {"star fish" , 255 , 25, 113 },
    {"stalactite",255 , 229 , 208},
    {"steel grey" , 109 , 105, 111 },
    {"steel blue" , 67 , 102, 124 },
    {"stewart blue" , 45 , 51, 108 },
    {"steak brown" , 105 , 50, 20 },
    {"stoic",77 , 77 , 77},
    {"storm green" , 105 , 150, 110 },
    {"storm gray" , 113 , 132, 130 },
    {"storm blue" , 18 , 50, 61 },
    {"stone gray" , 134 , 126, 113 },
    {"strata blue" , 140 , 140, 160 },
    {"straw",255 , 235 , 181},
    {"strawberry",187 , 0 , 75},
    {"strawberry ice" , 255 , 155, 159 },
    {"strawberry soda" , 241 , 81, 131 },
    {"strawberry red" , 217 , 0, 102 },
    {"snow",255 , 250 , 250},
    {"snow white" , 250 , 250, 250 },
    {"spice brown" , 99 , 71, 47 },
    {"spanish orenge" , 255 , 129, 47 },
    {"spanish orange" , 201 , 104, 14 },
    {"spanish violet" , 47 , 43, 113 },
    {"spanish rose" , 255 , 153, 67 },
    {"sparta blue" , 0 , 203, 240 },
    {"spinach green" , 38 , 115, 38 },
    {"spinach green" , 115 , 128, 95 },
    {"spinel rose" , 186 , 127, 147 },
    {"spin drift" , 218 , 225, 209 },
    {"sphynx",118 , 82 , 68},
    {"sprout",51 , 255 , 153},
    {"spree red" , 191 , 0, 75 },
    {"spring green" , 164 , 232, 97 },
    {"spring stome" , 197 , 255, 210 },
    {"spring time" , 252 , 120, 134 },
    {"spring note" , 0 , 190, 70 },
    {"spruce green" , 51 , 102, 0 },
    {"spray green" , 150 , 212, 216 },
    {"spectrum red" , 255 , 25, 99 },
    {"sporting blue" , 32 , 89, 124 },
    {"sumatra",0 , 126 , 224},
    {"smalt",58 , 71 , 137},
    {"smoky aqua" , 178 , 51, 178 },
    {"smoky purple" , 175 , 135, 190 },
    {"smoky beige" , 170 , 155, 135 },
    {"smoky leaf" , 140 , 150, 155 },
    {"smoke gray" , 117 , 133, 118 },
    {"smok blue" , 54 , 79, 101 },
    {"sultan",189 , 19 , 48},
    {"slate",98 , 100 , 104},
    {"slate green" , 96 , 102, 96 },
    {"slate gray" , 81 , 83, 86 },
    {"slate violet" , 90 , 80, 105 },
    {"slate blue" , 94 , 113, 134 },
    {"sailor blue" , 51 , 150, 255 },
    {"sevillan rot" , 255 , 0, 0 },
    {"zeus",0 , 29 , 42},
    {"sage green" , 118 , 146, 101 },
};

static struct color whiteColor = { "white", 255, 255, 255 };

@interface ColorMixer ()
@property (nonatomic) int colorListSize;
@property (nonatomic) int index;
@property (nonatomic) struct color lastColor;
@end

@implementation ColorMixer

- (id)init
{
    self = [super init];
    if (self) {
        srand(time(NULL));
        _colorListSize = sizeof(colorList) / sizeof(struct color);
        _lastColor = whiteColor;
    }
    return self;
}

- (void)changeColor
{
    _index = rand() % _colorListSize;
    struct color *color = &colorList[_index];
    NSLog(@"New color %s", colorList[_index].name);

    _colorRed = [[Interporation alloc] initWithDuration:3.0f start:_lastColor.r end:color->r];
    _colorGreen = [[Interporation alloc] initWithDuration:3.0f start:_lastColor.g end:color->g];
    _colorBlue = [[Interporation alloc] initWithDuration:3.0f start:_lastColor.b end:color->b];

    _lastColor = colorList[_index];
}

- (char *)colorName
{
    return colorList[_index].name;
}

@end
