//
//  Shader.fsh
//  ESFullColorBossa
//
//  Created by Enamel Systems on 2014/01/11.
//  Copyright (c) 2014 Enamel Systems. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
