/***************************************************************************
 *   Copyright (C) 2016 by Hendrik Vennekate                               *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#include "rectanglevaluetrait.h"
#include <QString>

CxxTest::ValueTraits<QRectF>::ValueTraits(const QRectF &rect)
{
  value = ("("
           + QString::number(rect.topLeft().x()) + ", "
           + QString::number(rect.topLeft().y()) + ", "
           + QString::number(rect.width()) + ", "
           + QString::number(rect.height()) + ")"
           ).toStdString();
}


const char *CxxTest::ValueTraits<QRectF>::asString() const
{
  return value.c_str();
}
