# 1. Introduction


## 1.1 Background

*Basketball is spatial.* Any event that occurs during a basketball game—a made shot, a missed shot, a rebound—has a corresponding spatial or spatio-temporal information embedded in it and, one can argue, that location oftentimes plays an important role in its occurrence or success.

If you think of the basketball court as a map, a parcel of the earth, or simply a cartesian coordinate plane then every location on the court can be specified by a coordinate pair. If we consider one type of basketball event—a shot or field goal—every occurrence of this event on the court will have its own corresponding coordinates. Aside from coordinates, these field goals can also have attributes or marks—the name of the player, the name of the team, the opponent, the time left on the clock, whether the shot was made or not, whether it was defended—that provide other information about the field goal. If we take this collection of field goals, what we actually have is a collection of points in space that is, similar to any spatial point dataset, susceptible to spatial analysis. This is why it makes sense to analyze basketball from a spatial perspective.

The advent of player tracking systems in basketball such as the SportVU Player Tracking System used in the National Basketball Association (NBA) has enabled research and studies that use location data to create a deeper understanding of the spatial nature of the game and even challenge conventional wisdom. Optical tracking data has been used to study shooting and introduce spatially-aware metrics for analysing shooting tendencies and potency—metrics like Spread and Range (Goldsberry, 2012) that measure how much of the court a player shoots and scores from, Spatial Shooting Effectiveness (SSE) and Points Over League Average (POLA) (Shortridge et al., 2014) that compare a player’s actual and expected scoring performance based on the spatial distribution of his shots, and Lineups Points Lost (LPL) (Sandholtz et al., 2019) that looks at field goals as an optimal allocation problem and computes the difference between what a five-man lineup is expected to score if they optimized their choice of field goals versus what the same five-man lineup actually scores. Spatial analysis has also been used to study and deconstruct rebounding with new metrics for positioning, hustle, and conversion of rebounds generated using a Voronoi-tessellation approach combined with a spatial probability distribution (Maheswarean et al., 2012; Maheswaran et al., 2014). Defense has also been studied (Goldsberry et al., 2013; Franks et al., 2015) as well as the effects of player motion on creating open shots (D’Amour et al., 2015). Optical tracking data has even been used to determine the value of different areas on the court (Cervone et al., 2016a) and predict the outcomes of basketball possessions (Cervone et al., 2016).

Truly, the application of spatial analysis in basketball has added a new dimension to how we view the game. 


## 1.2 Basketball analysis in the Philippines


## 1.3 Overview of the research

The current state of basketball analysis in the Philippines provides an opportunity to utilize spatial analysis techniques in Philippine basketball and show not only that it can be done but also its applications in evaluating the abilities and performance of players and teams.

This research provides methods and metrics for analyzing, visualizing, and describing scoring in Philippine basketball—particularly the UAAP—in a manner that explicitly accounts for the spatial nature of shooting. It utilizes a matrix decomposition algorithm known as Non-negative Matrix Factorization (NMF) to divide the court into areas or shooting zones where field goals are commonly taken and provide information about how frequently players shoot from these shooting zones. Using this information, players are grouped and compared according to their shooting habits. It also presents spatial metrics to evaluate shooting, scoring, and defense that build on the SSE and POLA metrics introduced by Shortridge (2014). These metrics measure the scoring effectiveness at different locations on the court by comparing the expected number of points scored and the actual points scored at these locations.

Finally, the research applies these methods and metrics to a case study of the UAAP Men’s Basketball Tournament (Season 81) and showcases the value of spatial analysis in evaluating teams, players, and winning in basketball.


## 1.4 Research objectives

The general goal of this research is to display and highlight the value of spatial analysis as applied in Philippine basketball. To meet this goal, the specific objectives of this research are:
1. To divide the court into shooting areas stochastically by using the spatial dataset of field goals to find commonly occurring patterns of where field goals are taken;
2. To group similar players based on their shooting tendencies;
3. To generate spatially-aware metrics of shooting and show how they can be applied to analyze players and teams; and
4. To create and share a spatial dataset of field goals that can be used for future research.


## 1.5 Thesis structure

This thesis is divided into five chapters. Chapter 1 provides a background of how spatial analysis has been used to study basketball abroad, the current use of analytics in Philippine basketball, and presents the overview and objectives of the study. Chapter 2 gives a review of relevant literature on the use of spatial analysis in Philippine basketball, the spatial characterization of field goals using Non-negative Matrix Factorization, and different spatial metrics of shooting. Chapter 3 describes the scope and delimitation of the study, the dataset used, the methods employed, and the spatial metrics generated. Chapter 4 presents a case study applying the methods and metrics generated by the research on the UAAP MBT (Season 81) and provides a detailed discussion of the results. Chapter 5 gives the summary and conclusions of the study and outlines recommendations for future research. The remaining sections contain the references, appendices, glossary of terms, and other supplementary materials related to the study.


# 2. Review of Literature

A review of methods for quantifying and characterizing basketball gameplay for both the player and team level is given by Tenner and Franks (2020) but most of the literature pertains to studies using data from the National Basketball Association (NBA). Although it was noted that most of the methods discussed there were relevant across all basketball leagues, looking at the current body of work around the spatial analysis of basketball, it becomes apparent that such studies are not, if rarely, done in the Philippine context.


## 2.1 Spatial analysis of Philipine basketball

The use of spatial analytics in mainstream Philippine basketball is not as common as it is abroad. This can be attributed to the lack of readily available spatial data that is needed for spatial analysis. Basketball leagues in the Philippines either do not have player tracking data or they do not share it publicly.

One study that looked at the entire pipeline of spatial analysis for Philippine basketball—from data extraction, storage, analysis, and presentation—was CourtVisionPH by Pintor and Cataniag (2014). Due to the unavailability of field goal location data, CourtVisionPH relied on extracting shooting locations from broadcast basketball videos by utilizing the concept of transformation between two coordinate reference systems—that is, the coordinates on the video frame where a shot is taken can be mapped to its corresponding location on a model of the basketball court whose dimensions and coordinates are known. The system took advantage of the fact that a regulation basketball court has a standard size and that there are easily-distinguishable markings on the court that could serve as control points for solving the coordinate transformation problem. These points included the corners of the baseline, intersections of court lines (e.g. three-point line and baseline, paint and baseline, half-court line and sideline), the corners of the paint, and other markings whose positions on the court are known. After extracting the field goal locations, the data was stored in a database and spatial metrics were computed and visualized.  Figure 2.1 details the CourtVisionPH system.

**Figure 2.1**

*The CourtVisionPH System (Pintor and Cataniag, 2014)*

![The CourtVisionPH System (Pintor and Cataniag, 2014)][img-courtvisionph]

*Note:* The system was divided into three primary modules: a data extraction, data storage, and data analysis/visualization module. Field goal data is extracted semi-automatically from a video source and stored in a database. The data analysis and visualization module uses the stored data to perform queries, compute metrics, and generate maps.

Although crude, CourtVisionPH demonstrated that the spatial analysis of shooting is possible in the Philippine context. The system has received some updates since its release notably the use of a spatial database and existing geospatial applications such as QGIS for the analysis and presentation instead of the original standalone analysis/visualization application. At the time when CourtVisionPH was created, the Spread and Range metrics first introduced by Goldsberry (2012) and used by the system were still considerably novel but since then, the number of researches and studies that applied spatial analysis to shooting have grown and newer methods and metrics have been introduced.  Some of these methods and metrics are discussed in the next section.


## 2.2 Spatial characterization of field goals

Dividing the court into shooting zones or hot zones is a common technique used to analyze shooting. Using this approach, analysts can compute and compare how players and teams shoot at predefined partitions of the court. Most of the time however, the way the court divisions are defined is arbitrary and dependent on the person doing the analysis. Even though common court divisions include general areas such as the paint, the mid-range area, the three-point area, the restricted area, the non-restricted area in the paint, the left and right baseline, the left and right block to elbow, the key, the top of the key three-pointer, the left and right wing three-pointers, the corner three-pointers, the way these areas  are delineated on the court still vary.  

Figure 2.2 shows how these general areas can be divided differently on the court.

**Figure 2.2**

*Shooting zone divisions (Top: FIBA LiveStats; Bottom,: NBA)*

![Shooting zone divisions (FIBA LiveStats)][img-shootingzones-fifa]

![Shooting zone divisions (NBA)][img-shootingzones-nba]

*Note:* The FIBA LiveStats and NBA divisions partition the court into the same general areas but do so differently.

Although there is value in having predefined court divisions, we can’t definitely say that these divisions characterize the shooting patterns present in a field goal dataset. What these divisions represent is an idealized version of where and how we think field goals will be grouped together before the fact but once players start taking shots, the actual patterns of these field goals and areas where they are commonly taken might partition the court differently. In order to characterize where players take shots and how frequently they take them, a data-driven approach that divides the court based on patterns in the field goal dataset is needed.
	
Finding patterns in spatial datasets can be done using clustering algorithms like K-means clustering or matrix decomposition algorithms like Principal Component Analysis (PCA) or Singular Value Decomposition (SVD). In recent years, the process of Non-negative Matrix Factorization (NMF) has gained traction in basketball analytics for its ability to divide the court into parts and provide an approximation of players’ shooting habits in those parts.


### 2.2.1 Finding spatial basis vectors using Non-negative Matrix Factorization

Non-negative Matrix Factorization or NMF is a matrix decomposition algorithm that assumes some non-negative matrix V can be approximated by the product of two lower-rank non-negative matrices W and B where as seen in (2.1).

![NMF formula][img-nmf-vwb] (2.1)

The matrix ![NMF data matrix][img-nmf-v] is composed of N data points each of length X, the basis loadings or weight matrix ![NMF weights matrix][img-nmf-w] consists of N non-negative weight vectors, and the basis matrix ![NMF basis vectors][img-nmf-b] contains K basis vectors. Each data point in V can be reconstructed using a combination of W and B. (Miller, 2014)

A distinct characteristic of NMF is that it constrains all of its component matrices to be non-negative. Because of this, the resulting basis vectors B tend to be disjoint and exhibit a “parts-based” decomposition that corresponds to frequently occurring patterns in the sample. This has the advantage of avoiding the cancellation phenomenon exhibited by other non-constrained matrix factorization methods like PCA. This restrictive property of NMF also results in sparser and more interpretable basis vectors. (Lee & Seung, 1999)

In the case of basketball, using NMF to decompose a field goal dataset makes sense due to the following reasons: first, the field goal matrix—or the collection of field goals at different locations on the court—is always non-negative because it is impossible to attempt a negative number of shots; second, the outputs of NMF correspond intuitively to basketball concepts. The spatial basis vectors in B can be interpreted as disjoint sub-intensities or parts that represent shot-types or shooting zones on the court. Meanwhile, the player weights in W can be used to summarize the spatial shooting habits of individual players inside the spatial basis vectors in B (Miller et al., 2014; Franks et al., 2015).


### 2.2.2 Grouping similar players based on shooting characteristics


## 2.3 Spatial metrics of shooting


### 2.3.1 Spread and Range


### 2.3.2 Spatial Shooting Effectiveness and Points Over League Average


### 2.3.3 Lineups Points Lost



## 2.4 Hierarchical and high-resolution data models


# 3.  Methodology


## 3.1 Scope and delimitation


## 3.2 The data


## 3.3 Spatial characterization of field goals using NMF


### 3.3.1 Finding the spatial basis and basis loadings


### 3.3.2 Grouping similar players based on their shooting habits


## 3.4 Spatial metrics of shooting


### 3.4.1 Modeling scoring ability


### 3.4.2 Spatial Scoring Effectiveness (SScE)


### 3.4.3 Points Relative to League Average (PRLA)


### 3.4.4 Team, Opponents, and Net SScE and PRLA


### 3.4.5 Incorporating player similarities


### 3.4.6 Comparison of SScE and PRLA with conventional shooting metrics


# 4. Result and Discussion


# 5. Summary and Recommendations


# Bibliography




<!-- REFERENCE LINKS -->



<!-- IMAGE LINKS -->

[img-courtvisionph]: images/image45.png "The CourtVisionPH System (Pintor and Cataniag, 2014)"
[img-shootingzones-fifa]: images/image48.png "Shooting zone divisions (FIBA LiveStats)"
[img-shootingzones-nba]: images/image50.png "Shooting zone divisions (NBA)"
[img-nmf-vwb]: images/image1.png "NMF formula"
[img-nmf-v]: images/image2.png "NMF matrix"
[img-nmf-w]: images/image3.png "NMF weights matrix"
[img-nmf-b]: images/image4.png "NMF basis vector"