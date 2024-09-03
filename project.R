---
title: "Social Media Intelligence - Project"
output:
  pdf_document: default
  word_document: default
---

Name: Rizwan Karim Rafat

Student ID: 22061272


Subject Code: COMP7025

By including this statement, we the authors of this work, verify that:

* I hold a copy of this assignment that we can produce if the original is lost or damaged.

* I hereby certify that no part of this assignment/product has been copied from any other student’s work
or from any other source except where due acknowledgement is made in the assignment.

* No part of this assignment/product has been written/produced for us by another person except where
such collaboration has been authorised by the subject lecturer/tutor concerned.

* I am aware that this work may be reproduced and submitted to plagiarism detection software programs
for the purpose of detecting possible plagiarism (which may retain a copy on its database for future
plagiarism checking).

* I hereby certify that we have read and understand what the School of Computing and Mathematics
defines as minor and substantial breaches of misconduct as outlined in the learning guide for this unit.

Note: An examiner or lecturer/tutor has the right not to mark this project report if the above
declaration has not been added to the cover of the report.

\newpage

# 1. Gathering the Network

```{r warning = FALSE}
library("rtoot")
library("tidyr")
library("dplyr")
library("igraph")
library("poweRlaw")
```

```{r}
#toots <- get_timeline_hashtag(hashtag = "WSUCOMP7025", limit = 40L)
#save(toots, file = "toots.Rdata")
load("toots.Rdata")
```

```{r}
toots_table <- as.data.frame(toots)
```

```{r warning = FALSE}
toots_table <- separate(toots_table, uri, into = paste0("uri_part", 1:10), sep = "/")
```

```{r}
filtered_table_mastodon.social <- toots_table %>% filter(uri_part3 == "mastodon.social")
count_mastodon.social <- nrow(filtered_table_mastodon.social)

filtered_table_mastodon.bot <- toots_table %>% filter(uri_part3 == "mastodon.bot")
count_mastodon.bot <- nrow(filtered_table_mastodon.bot)

filtered_table_mstdn.party <- toots_table %>% filter(uri_part3 == "mstdn.party")
count_mstdn.party <- nrow(filtered_table_mstdn.party)

filtered_table_universeodon.com <- toots_table %>% filter(uri_part3 == "universeodon.com")
count_universeodon.com <- nrow(filtered_table_universeodon.com)

filtered_table_convo.casa <- toots_table %>% filter(uri_part3 == "convo.casa")
count_convo.casa <- nrow(filtered_table_convo.casa)

filtered_table_scholar.social <- toots_table %>% filter(uri_part3 == "scholar.social")
count_scholar.social <- nrow(filtered_table_scholar.social)
```

```{r}
server_data <- data.frame(
  Server = c("mastodon.social", "mastodon.bot", "mstdn.party", "universeodon.com", 
             "convo.casa", "scholar.social"),
  Count = c(count_mastodon.social, count_mastodon.bot, count_mstdn.party, 
            count_universeodon.com, count_convo.casa, count_scholar.social)
)
print(server_data)
```

From the table above we can observe that 20 toots belong to the mastodon.social server. The rest of the servers contain 1 toot in each among which the server mastodon.bot is a bot.

\newpage

# 2. Following Graph

```{r}
unique_usernames <- c()

for (i in 1:25) {
  username <- toots$account[[i]]$username
  if (!(username %in% unique_usernames)) {
    cat("Username at index", i, ":", username, "\n")
    unique_usernames <- c(unique_usernames, username)
  }
}
```

From the list above we can observe all the unique users/students who tooted with the hashtag #WSUCOMP7025. Among the users/students, trending (index 3) is a bot.

## The following is done to find out who follows who:

```{r}
toots_table$account[[1]]$username
harikrizhnavarma_follows <- get_account_following(toots_table$account[[1]]$id)
harikrizhnavarma_follows_df <- as.data.frame(harikrizhnavarma_follows)
harikrizhnavarma_follows_df$username
```

```{r}
toots_table$account[[2]]$username
lapark_follows <- get_account_following(toots_table$account[[2]]$id)
lapark_follows_df <- as.data.frame(lapark_follows)
lapark_follows_df$username
```

```{r}
toots_table$account[[3]]$username
trending_follows <- get_account_following(toots_table$account[[3]]$id)
trending_follows_df <- as.data.frame(trending_follows)
trending_follows_df
```

## User trending does not follow any of the accounts.


```{r}
toots_table$account[[4]]$username
BibekCh_follows <- get_account_following(toots_table$account[[4]]$id)
BibekCh_follows_df <- as.data.frame(BibekCh_follows)
BibekCh_follows_df$username
```

```{r}
toots_table$account[[5]]$username
JessiaKyaw_follows <- get_account_following(toots_table$account[[5]]$id)
JessiaKyaw_follows_df <- as.data.frame(JessiaKyaw_follows)
JessiaKyaw_follows_df$username
```

```{r}
toots_table$account[[6]]$username
user22131755_follows <- get_account_following(toots_table$account[[6]]$id)
user22131755_follows_df <- as.data.frame(user22131755_follows)
user22131755_follows_df$username
```

```{r}
toots_table$account[[7]]$username
A_user_follows <- get_account_following(toots_table$account[[7]]$id)
A_user_follows_df <- as.data.frame(A_user_follows)
A_user_follows_df$username
```

```{r}
toots_table$account[[9]]$username
HM69_follows <- get_account_following(toots_table$account[[9]]$id)
HM69_follows_df <- as.data.frame(HM69_follows)
HM69_follows_df$username
```

```{r}
toots_table$account[[10]]$username
iamseemco_follows <- get_account_following(toots_table$account[[10]]$id)
iamseemco_follows_df <- as.data.frame(iamseemco_follows)
iamseemco_follows_df$username
```

```{r}
toots_table$account[[11]]$username
bhubanpun_follows <- get_account_following(toots_table$account[[11]]$id)
bhubanpun_follows_df <- as.data.frame(bhubanpun_follows)
bhubanpun_follows_df$username
```

```{r}
toots_table$account[[13]]$username
user22105983_follows <- get_account_following(toots_table$account[[13]]$id)
user22105983_follows_df <- as.data.frame(user22105983_follows)
user22105983_follows_df$username
```

```{r}
toots_table$account[[14]]$username
riya_john_follows <- get_account_following(toots_table$account[[14]]$id)
riya_john_follows_df <- as.data.frame(riya_john_follows)
riya_john_follows_df$username
```

```{r}
toots_table$account[[15]]$username
chowdhuryshaheb66_follows <- get_account_following(toots_table$account[[15]]$id)
chowdhuryshaheb66_follows_df <- as.data.frame(chowdhuryshaheb66_follows)
chowdhuryshaheb66_follows_df
```

## User chowdhuryshaheb66 does not follow any of the accounts.


```{r}
toots_table$account[[16]]$username
pakhi_follows <- get_account_following(toots_table$account[[16]]$id)
pakhi_follows_df <- as.data.frame(pakhi_follows)
pakhi_follows_df$username
```

```{r}
toots_table$account[[17]]$username
user17979535meow_follows <- get_account_following(toots_table$account[[17]]$id)
user17979535meow_follows_df <- as.data.frame(user17979535meow_follows)
user17979535meow_follows_df
```

## User 17979535meow does not follow any of the accounts.


```{r}
toots_table$account[[18]]$username
Ideree_follows <- get_account_following(toots_table$account[[18]]$id)
Ideree_follows_df <- as.data.frame(Ideree_follows)
Ideree_follows_df$username
```

```{r}
toots_table$account[[19]]$username
mgrishma17_follows <- get_account_following(toots_table$account[[19]]$id)
mgrishma17_follows_df <- as.data.frame(mgrishma17_follows)
mgrishma17_follows_df$username
```

```{r}
toots_table$account[[20]]$username
ayazkhanP_follows <- get_account_following(toots_table$account[[20]]$id)
ayazkhanP_follows_df <- as.data.frame(ayazkhanP_follows)
ayazkhanP_follows_df$username
```

```{r}
toots_table$account[[21]]$username
user6sahani_follows <- get_account_following(toots_table$account[[21]]$id)
user6sahani_follows_df <- as.data.frame(user6sahani_follows)
user6sahani_follows_df$username
```

```{r}
toots_table$account[[22]]$username
user22049113_follows <- get_account_following(toots_table$account[[22]]$id)
user22049113_follows_df <- as.data.frame(user22049113_follows)
user22049113_follows_df
```

## User 22049113 does not follow any of the accounts.


```{r}
toots_table$account[[23]]$username
sushila_follows <- get_account_following(toots_table$account[[23]]$id)
sushila_follows_df <- as.data.frame(sushila_follows)
sushila_follows_df$username
```

```{r}
toots_table$account[[24]]$username
nicole05_follows <- get_account_following(toots_table$account[[24]]$id)
nicole05_follows_df <- as.data.frame(nicole05_follows)
nicole05_follows_df$username
```


```{r}
graph <- graph(edges=c(toots_table$account[[1]]$username,harikrizhnavarma_follows_df$username[[1]],
                       toots_table$account[[1]]$username,harikrizhnavarma_follows_df$username[[2]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[1]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[2]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[3]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[4]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[5]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[6]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[7]],
                       toots_table$account[[2]]$username,lapark_follows_df$username[[8]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[1]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[2]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[3]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[4]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[5]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[6]],
                       toots_table$account[[4]]$username,BibekCh_follows_df$username[[7]],
                       toots_table$account[[5]]$username,JessiaKyaw_follows_df$username[[1]],
                       toots_table$account[[5]]$username,JessiaKyaw_follows_df$username[[2]],
                       toots_table$account[[5]]$username,JessiaKyaw_follows_df$username[[3]],
                       toots_table$account[[5]]$username,JessiaKyaw_follows_df$username[[4]],
                       toots_table$account[[5]]$username,JessiaKyaw_follows_df$username[[5]],
                       toots_table$account[[5]]$username,JessiaKyaw_follows_df$username[[6]],
                       toots_table$account[[6]]$username,user22131755_follows_df$username[[1]],
                       toots_table$account[[6]]$username,user22131755_follows_df$username[[2]],
                       toots_table$account[[7]]$username,A_user_follows_df$username[[1]],
                       toots_table$account[[7]]$username,A_user_follows_df$username[[2]],
                       toots_table$account[[9]]$username,HM69_follows_df$username[[1]],
                       toots_table$account[[10]]$username,iamseemco_follows_df$username[[1]],
                       toots_table$account[[10]]$username,iamseemco_follows_df$username[[2]],
                       toots_table$account[[10]]$username,iamseemco_follows_df$username[[3]],
                       toots_table$account[[10]]$username,iamseemco_follows_df$username[[4]],
                       toots_table$account[[10]]$username,iamseemco_follows_df$username[[5]],
                       toots_table$account[[11]]$username,bhubanpun_follows_df$username[[1]],
                       toots_table$account[[11]]$username,bhubanpun_follows_df$username[[2]],
                       toots_table$account[[11]]$username,bhubanpun_follows_df$username[[3]],
                       toots_table$account[[11]]$username,bhubanpun_follows_df$username[[4]],
                       toots_table$account[[13]]$username,user22105983_follows_df$username[[1]], 
                       toots_table$account[[14]]$username,riya_john_follows_df$username[[1]],
                       toots_table$account[[14]]$username,riya_john_follows_df$username[[2]],
                       toots_table$account[[14]]$username,riya_john_follows_df$username[[3]],
                       toots_table$account[[14]]$username,riya_john_follows_df$username[[4]],
                       toots_table$account[[16]]$username,pakhi_follows_df$username[[1]],
                       toots_table$account[[16]]$username,pakhi_follows_df$username[[2]],
                       toots_table$account[[16]]$username,pakhi_follows_df$username[[3]],
                       toots_table$account[[16]]$username,pakhi_follows_df$username[[4]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[1]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[2]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[3]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[4]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[5]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[6]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[7]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[8]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[9]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[10]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[11]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[12]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[13]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[14]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[15]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[16]],
                       toots_table$account[[18]]$username,Ideree_follows_df$username[[17]],
                       toots_table$account[[19]]$username,mgrishma17_follows_df$username[[1]],
                       toots_table$account[[19]]$username,mgrishma17_follows_df$username[[2]],
                       toots_table$account[[19]]$username,mgrishma17_follows_df$username[[3]],
                       toots_table$account[[19]]$username,mgrishma17_follows_df$username[[4]],
                       toots_table$account[[19]]$username,mgrishma17_follows_df$username[[5]],
                       toots_table$account[[19]]$username,mgrishma17_follows_df$username[[6]],
                       toots_table$account[[20]]$username,ayazkhanP_follows_df$username[[1]],
                       toots_table$account[[20]]$username,ayazkhanP_follows_df$username[[2]],
                       toots_table$account[[20]]$username,ayazkhanP_follows_df$username[[3]],
                       toots_table$account[[21]]$username,user6sahani_follows_df$username[[1]], 
                       toots_table$account[[23]]$username,sushila_follows_df$username[[1]],
                       toots_table$account[[23]]$username,sushila_follows_df$username[[2]],
                       toots_table$account[[23]]$username,sushila_follows_df$username[[3]],
                       toots_table$account[[23]]$username,sushila_follows_df$username[[4]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[1]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[2]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[3]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[4]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[5]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[6]],
                       toots_table$account[[24]]$username,nicole05_follows_df$username[[7]]), 
               directed=TRUE)

plot(graph, layout = layout.kamada.kawai, vertex.size = 10, vertex.label.cex = 0.8, 
     cex.lab = 0.8, edge.arrow.size = 0.3, main = "Student Network Graph")
```

```{r}
graph_components <- components(graph)
graph_components
```

## There is only `r graph_components$no` component in the graph with `r graph_components$csize` nodes.

The graph has a central node representing the student "Ideree" with many outgoing and incoming connections. This indicates that this student has a key influence within the student network.

Several nodes are directly connected to the central node which represents a core group of friends who interact with each other frequently.

Some students including but not limited to "mkst_2367", "HM69", "Remant", "Vtee" have only one connection to the central or other nodes.

\newpage

# 3. Graph Statistics

```{r}
graph_diameter <- diameter(graph)
graph_diameter
graph_density <- edge_density(graph)
graph_density
```

The diameter of the graph is `r graph_diameter`

The density of the graph is `r graph_density`

```{r}
in_degree_dist <- degree_distribution(graph, mode = "in")

plot(in_degree_dist, log = "xy", main = "In-degree Distribution", xlab = "In-degree", 
     ylab = "Frequency")
```

```{r}
fit <- fit_power_law(degree(graph, mode = "in"))

power_law_coefficient <- fit$alpha
power_law_coefficient
```

Estimated Power Law coefficient (c): `r power_law_coefficient`

The Power Law coefficient reveals that the student network has a few students with a lot of connections. The number of students with many friends drops off quickly. The students network is not dominated by a few highly connected students but rather has connections more evenly distributed among many students.

\newpage

# 4. Graph Structure

```{r}
adj_matrix <- as_adjacency_matrix(graph, sparse = FALSE)

graph_adj <- graph_from_adjacency_matrix(adj_matrix, mode = "directed")

components <- components(graph_adj, mode = "strong")

gscc_index <- which.max(components$csize)
gscc_nodes <- which(components$membership == gscc_index)

in_nodes <- which(apply(distances(graph_adj, v = V(graph_adj), 
                                  to = gscc_nodes, mode = "in"), 1, function(x) 
                                    any(x < Inf)) & !(V(graph_adj) %in% gscc_nodes))

out_nodes <- which(apply(distances(graph_adj, v = gscc_nodes, 
                                   to = V(graph_adj), mode = "out"), 2, function(x) 
                                     any(x < Inf)) & !(V(graph_adj) %in% gscc_nodes))

tendrils_and_tubes_nodes <- setdiff(1:vcount(graph_adj), c(gscc_nodes, in_nodes, out_nodes))

V(graph_adj)$color <- "yellow"
V(graph_adj)$color[gscc_nodes] <- "red"
V(graph_adj)$color[in_nodes] <- "blue"
V(graph_adj)$color[out_nodes] <- "green"
V(graph_adj)$color[tendrils_and_tubes_nodes] <- "grey"

plot(graph_adj, layout = layout.kamada.kawai, vertex.size = 10, vertex.label.cex = 0.8, 
     cex.lab = 0.8, vertex.color = V(graph_adj)$color, edge.arrow.size = 0.3,
     main = "Decomposition of the Student Network Graph",
     sub = "Red: GSCC, Blue: IN, Green: OUT, Grey: Tendrils and Tubes")
```

From the graph above we can observe that there are no IN's or Trendils and Tubes on the decomposed student network graph.

We can hence suggest that there is a core group of student (GSCC) those who share information and resources among each other leading to better academic performance. At the same time, there are students (OUT component) those who receive benefits from the GSCC but do not contribute back.

\newpage

# 5. Account Popularity

```{r}
page_rank_scores <- page_rank(graph, directed = TRUE, damping = 0.85)$vector

top_ten_accounts <- sort(page_rank_scores, decreasing = TRUE)[1:10]

in_deg <- degree(graph, mode = "in")

comparison_df <- data.frame(
  Account = names(page_rank_scores),
  PageRank = page_rank_scores,
  In_Degree = in_deg[names(page_rank_scores)]
)

top_ten_comparison <- comparison_df[comparison_df$Account %in% names(top_ten_accounts), ]
top_ten_comparison_sorted <- top_ten_comparison[order(-top_ten_comparison$PageRank), ]
print(top_ten_comparison_sorted[, -1])
```

## High PageRank and High In-Degree:

lderee has the highest PageRank of `r top_ten_comparison_sorted$PageRank[1]` and the highest in-degree of `r top_ten_comparison_sorted$In_Degree[1]` followed by lapark (PageRank `r top_ten_comparison_sorted$PageRank[2]`, in-degree `r top_ten_comparison_sorted$In_Degree[2]`). This indicates that lderee is not only highly connected but also important within the student network.

## Moderate PageRank and In-Degree:

Several students exhibit moderate PageRank and in-degree, indicating notable influence and connectivity within the network. Notably, pakhi (PageRank `r top_ten_comparison_sorted$PageRank[4]`, in-degree `r top_ten_comparison_sorted$In_Degree[4]`), nicole05 (PageRank `r top_ten_comparison_sorted$PageRank[3]`, in-degree `r top_ten_comparison_sorted$In_Degree[3]`), BibekCh (PageRank `r top_ten_comparison_sorted$PageRank[6]`, in-degree `r top_ten_comparison_sorted$In_Degree[6]`), and ayazkhanP (PageRank `r top_ten_comparison_sorted$PageRank[5]`, in-degree `r top_ten_comparison_sorted$In_Degree[5]`) are key nodes with moderate incoming connections, reflecting their significance and steady influence within the network.

## Lower PageRank and In-Degree:

Despite having fewer connections, some students exhibit a lower PageRank and in-degree, indicating their connections might be of high quality or importance. Notably, harikrizhnavarma (PageRank `r top_ten_comparison_sorted$PageRank[7]`, in-degree `r top_ten_comparison_sorted$In_Degree[7]`), iamseemco (PageRank `r top_ten_comparison_sorted$PageRank[8]`, in-degree `r top_ten_comparison_sorted$In_Degree[8]`), mgrishma17 (PageRank `r top_ten_comparison_sorted$PageRank[9]`, in-degree `r top_ten_comparison_sorted$In_Degree[9]`) and riya_john (PageRank `r top_ten_comparison_sorted$PageRank[10]`, in-degree `r top_ten_comparison_sorted$In_Degree[10]`) demonstrate this pattern, suggesting their significant yet specialized influence within the network.

\newpage

# 6. Account Selection

## Expected Payoff Calculation:

\[
\begin{aligned}
  E_1 &= 1 \cdot p_1 + 0.5 \cdot p_2 + 0.4 \cdot p_3 \\
  E_2 &= 0.2 \cdot p_1 + 1 \cdot p_2 + 0.2 \cdot p_3 \\
  E_3 &= 0.1 \cdot p_1 + 0.2 \cdot p_2 + 1 \cdot p_3 \\
\end{aligned}
\]

## Equating the Expected Payoffs:

\[
\begin{aligned}
  E_1 &= E_2 \\
  1 \cdot p_1 + 0.5 \cdot p_2 + 0.4 \cdot p_3 &= 0.2 \cdot p_1 + 1 \cdot p_2 + 0.2 \cdot p_3 \\
  4 \cdot p_1 - 2.5 \cdot p_2 + p_3 &= 0 \quad \text{(Equation 1)} \\
  E_1 &= E_3 \\
  1 \cdot p_1 + 0.5 \cdot p_2 + 0.4 \cdot p_3 &= 0.1 \cdot p_1 + 0.2 \cdot p_2 + 1 \cdot p_3 \\
  9 \cdot p_1 + 3 \cdot p_2 - 6 \cdot p_3 &= 0 \quad \text{(Equation 2)} \\
\end{aligned}
\]

## Constraint equation:

\[
\begin{aligned}
  p_1 + p_2 + p_3 = 1 \quad \text{(Equation 3)}
\end{aligned}
\]

## The system of equations can be represented in matrix form as:

\[
\begin{pmatrix}
  4 & -2.5 & 1 \\
  9 & 3 & -6 \\
  1 & 1 & 1
\end{pmatrix}
\begin{pmatrix}
  p_1 \\
  p_2 \\
  p_3
\end{pmatrix}
=
\begin{pmatrix}
  0 \\
  0 \\
  1
\end{pmatrix}
\]

## Solving with R

```{r}
m <- matrix(c(
  4, -2.5, 1,
  9, 3, -6,
  1, 1, 1
), nrow = 3, byrow = TRUE)

cons <- c(0, 0, 1)

solution <- solve(m, cons)

solution
```

Probability of choosing Parramatta: `r solution[1]`

Probability of choosing Kingswood: `r solution[2]`

Probability of choosing Campbelltown: `r solution[3]`

The higher probabilities of the Kingswood and Campbelltown (both above 40%) indicate a strategic focus on these campuses, perhaps due to their larger or more interconnected student populations, which can provide more comprehensive data for the study. The lower probability for Parramatta (approximately 15%) suggests it might be less central or have a smaller student population, reducing the risk of predictable and manipulable social networks.