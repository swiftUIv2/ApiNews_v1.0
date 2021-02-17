//
//  ArticleView.swift
//  ApiNews_v1.0
//
//  Created by emm on 16/02/2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25)
                         ),
                         failure: { error, _ in
                            PlaceHolderImageView()
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
            }else {
                PlaceHolderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4){
                Text(article.title ?? "")
                    .foregroundColor(.primary)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
        }
    }
}




struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}





struct PlaceHolderImageView: View {
    
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}




